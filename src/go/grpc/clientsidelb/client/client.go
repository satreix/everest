package main

import (
	"context"
	"flag"
	"log"
	"time"

	_ "github.com/mbobakov/grpc-consul-resolver"
	"github.com/satreix/everest/src/go/grpc/clientsidelb/server/service_config"
	"google.golang.org/grpc"
	pb "google.golang.org/grpc/examples/helloworld/helloworld"
)

func main() {
	addr := flag.String("addr", "127.0.0.1:50051", "")
	flag.Parse()

	conn, err := grpc.Dial(
		*addr,
		grpc.WithInsecure(),
		grpc.WithDefaultServiceConfig(service_config.ServiceConfigJSON()),
	)
	if err != nil {
		log.Fatal(err)
	}

	client := pb.NewGreeterClient(conn)

	t := time.NewTicker(250 * time.Millisecond)
	defer t.Stop()

	for {
		<-t.C
		callOnce(client)
	}
}

func callOnce(client pb.GreeterClient) {
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()

	resp, err := client.SayHello(ctx, &pb.HelloRequest{Name: "everest"})
	if err != nil {
		log.Printf("error: %s", err)
		return
	}

	log.Printf("resp: %#v", resp.Message)
}
