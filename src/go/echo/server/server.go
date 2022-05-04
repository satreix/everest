package main

import (
	"context"
	"flag"
	"log"
	"net"

	pb "github.com/satreix/everest/src/proto/helloworld"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	return &pb.HelloReply{Message: "Hello " + in.Name}, nil
}

func main() {
	var addr string
	flag.StringVar(&addr, "addr", "0.0.0.0:50051", "address")
	flag.Parse()

	srv := new(server)

	s := grpc.NewServer()
	pb.RegisterGreeterServer(s, srv)
	reflection.Register(s)

	ln, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	defer ln.Close()

	log.Printf("server listening on %s ...", addr)
	if err := s.Serve(ln); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
