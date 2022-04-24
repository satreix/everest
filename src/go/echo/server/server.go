package main

import (
	"context"
	"flag"
	"log"
	"net"

	pb "github.com/satreix/everest/src/proto/helloworld"
	"google.golang.org/grpc"
)

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received data: %#v", in)
	return &pb.HelloReply{Message: "Hello " + in.Name}, nil
}

func main() {
	addr := flag.String("addr", "127.0.0.1:1234", "address")
	flag.Parse()

	srv := new(server)

	s := grpc.NewServer()
	pb.RegisterGreeterServer(s, srv)

	ln, err := net.Listen("tcp", *addr)
	if err != nil {
		log.Fatalf("listen error: %s", err)
	}
	defer ln.Close()

	log.Printf("Listenning on %s ...", *addr)
	if err := s.Serve(ln); err != nil {
		log.Fatalf("gRPC server error: %s", err)
	}
}
