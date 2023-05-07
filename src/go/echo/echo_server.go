package main

import (
	"context"
	"flag"
	"net"
	"strings"
	"time"

	honeycomb "github.com/honeycombio/honeycomb-opentelemetry-go"
	"github.com/honeycombio/otel-config-go/otelconfig"
	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/helloworld"
	"go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	if in.Name == "error" {
		return nil, status.Error(codes.Internal, "internal error")
	}

	if strings.HasPrefix(in.Name, "slow") {
		time.Sleep(time.Duration(strings.Count(in.Name, "w")) * 100 * time.Millisecond)
	}

	return &pb.HelloReply{Message: "Hello " + in.Name}, nil
}

func main() {
	addr := flag.String("addr", "127.0.0.1:1234", "address")
	debug := flag.Bool("debug", false, "sets log level to debug")
	flag.Parse()

	logger, err := logging.SetupLogger(*debug)
	if err != nil {
		log.Fatal().
			Err(err).
			Msg("Logger setup error")
	}

	otelShutdown, err := otelconfig.ConfigureOpenTelemetry(
		otelconfig.WithSpanProcessor(honeycomb.NewBaggageSpanProcessor()),
	)
	if err != nil {
		log.Fatal().Err(err).Msg("error setting up OTel SDK")
	}
	defer otelShutdown()

	s := grpc.NewServer(
		grpc.ChainUnaryInterceptor(
			logging.UnaryServerInterceptor(logger),
			otelgrpc.UnaryServerInterceptor(),
		),
		grpc.ChainStreamInterceptor(
			logging.StreamServerInterceptor(logger),
			otelgrpc.StreamServerInterceptor(),
		),
	)

	pb.RegisterGreeterServer(s, new(server))
	reflection.Register(s)

	ln, err := net.Listen("tcp", *addr)
	if err != nil {
		logger.Fatal().Err(err).Msg("Listen error")
	}
	defer ln.Close()

	logger.Info().Str("addr", *addr).Msg("Server listening")
	if err := s.Serve(ln); err != nil {
		logger.Fatal().Err(err).Msg("Server error")
	}
}
