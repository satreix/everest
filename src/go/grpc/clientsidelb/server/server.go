package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net"
	"syscall"

	"github.com/oklog/run"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	pb "google.golang.org/grpc/examples/helloworld/helloworld"
	"google.golang.org/grpc/health"
	healthpb "google.golang.org/grpc/health/grpc_health_v1"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
)

const serviceName = "helloworld.Greeter"

var addr, hostname string
var hsrv = health.NewServer()
var services = []string{"", serviceName}

type server struct {
	pb.UnimplementedGreeterServer
}

func (s *server) SayHello(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
	log.Printf("Received: %v", in.GetName())
	switch in.Name {
	case "health:down":
		setStatus(hsrv, services, notServing)
	case "health:up":
		setStatus(hsrv, services, serving)
	}

	if !s.isServing(ctx) {
		return nil, status.Error(codes.Unavailable, "not serving")
	}

	return &pb.HelloReply{Message: "Hello " + in.Name + ", from " + hostname}, nil
}

func main() {
	flag.StringVar(&addr, "addr", "127.0.0.1:50051", "Address")
	flag.StringVar(&hostname, "hostname", determineHostname(), "Hostname")
	flag.Parse()

	srv := new(server)

	s := grpc.NewServer()
	pb.RegisterGreeterServer(s, srv)
	healthpb.RegisterHealthServer(s, hsrv)
	reflection.Register(s)

	var g run.Group

	signalExecute, signalInterrupt := signalHandler(context.Background(), syscall.SIGINT)
	g.Add(signalExecute, signalInterrupt)

	ln, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatalf("listen error: %s", err)
	}

	discoExecute, discoInterrupt, err := discoverService(serviceName, addr)
	if err != nil {
		log.Fatal(err)
	}

	g.Add(func() error {
		if err := discoExecute(); err != nil {
			return fmt.Errorf("disco register error: %s", err)
		}
		log.Printf("listenning on %s", ln.Addr())
		setStatus(hsrv, services, serving)
		return s.Serve(ln)
	}, func(err error) {
		hsrv.Shutdown()
		discoInterrupt(err)
		ln.Close()
	})

	log.Printf("server terminated with: %v", g.Run())
}
