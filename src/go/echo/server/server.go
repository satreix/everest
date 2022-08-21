package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net"
	"os"

	grpc_zap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
	pb "github.com/satreix/everest/src/proto/helloworld"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct {
	pb.UnimplementedGreeterServer

	hostname string
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	return &pb.HelloReply{Message: fmt.Sprintf("Hello %s, from %s", in.Name, s.hostname)}, nil
}

func main() {
	var addr string
	flag.StringVar(&addr, "addr", "0.0.0.0:50051", "address")
	flag.Parse()

	logger, err := zap.NewProduction()
	if err != nil {
		log.Fatal(err)
	}
	defer logger.Sync()

	hn, err := os.Hostname()
	if err != nil {
		log.Fatal(err)
	}

	srv := &server{hostname: hn}

	s := grpc.NewServer(
		grpc.ChainStreamInterceptor(
			grpc_zap.StreamServerInterceptor(logger),
		),
		grpc.UnaryInterceptor(
			grpc_zap.UnaryServerInterceptor(logger),
		),
	)
	pb.RegisterGreeterServer(s, srv)
	reflection.Register(s)

	ln, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	defer ln.Close()

	logger.Info("server listening ...", zap.String("address", addr))
	if err := s.Serve(ln); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
