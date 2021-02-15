package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"math/rand"
	"net"
	"os"
	"syscall"
	"time"

	"github.com/oklog/run"
	"google.golang.org/grpc"
	pb "google.golang.org/grpc/examples/helloworld/helloworld"
	"google.golang.org/grpc/reflection"
)

type server struct {
	pb.UnimplementedGreeterServer
	serverName string
}

func newServer(serverName string) *server {
	return &server{
		serverName: serverName,
	}
}

func (s *server) SayHello(_ context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received: %v", in.GetName())
	resp := pb.HelloReply{Message: "Hello " + in.Name + ", from " + s.serverName}
	return &resp, nil
}

func determineHostname() string {
	hostname, err := os.Hostname()
	if err != nil {
		log.Printf("Failed to get hostname: %v, will generate one", err)
		rand.Seed(time.Now().UnixNano())
		return fmt.Sprintf("generated-%03d", rand.Int()%100)
	}
	return hostname
}

func main() {
	addr := flag.String("addr", "127.0.0.1:50051", "Address")
	hostname := flag.String("hostname", "", "Hostname")
	flag.Parse()

	if *hostname == "" {
		*hostname = determineHostname()
	}

	srv := newServer(*hostname)

	s := grpc.NewServer()
	pb.RegisterGreeterServer(s, srv)
	reflection.Register(s)

	var g run.Group

	signalExecute, signalInterrupt := signalHandler(context.Background(), syscall.SIGINT)
	g.Add(signalExecute, signalInterrupt)

	ln, err := net.Listen("tcp", *addr)
	if err != nil {
		log.Fatalf("listen error: %s", err)
	}

	// FIXME more recent version of gRPC allow the use of pb.Greeter_ServiceDesc.ServiceName
	discoExecute, discoInterrupt, err := discoverService("helloworld.Greeter", *addr)
	if err != nil {
		log.Fatal(err)
	}

	g.Add(func() error {
		if err := discoExecute(); err != nil {
			return fmt.Errorf("disco register error: %s", err)
		}

		log.Printf("listenning on %s", ln.Addr())
		return s.Serve(ln)
	}, func(err error) {
		discoInterrupt(err)
		ln.Close()
	})

	log.Printf("server terminated with: %v", g.Run())
}
