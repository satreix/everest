package main

import (
	"context"
	"flag"
	"fmt"
	"net"

	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/helloworld"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Info().Str("params.in", fmt.Sprintf("%#v", in)).Msg("Received data")
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

	s := grpc.NewServer(
		grpc.ChainUnaryInterceptor(
			logging.UnaryServerInterceptor(logger),
		),
		grpc.ChainStreamInterceptor(
			logging.StreamServerInterceptor(logger),
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
