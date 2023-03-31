package main

import (
	"context"
	"flag"
	"log"

	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func main() {
	var addr string
	flag.StringVar(&addr, "addr", "localhost:50051", "grpc address")
	flag.Parse()

	conn, err := grpc.Dial(
		addr,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		log.Fatalf("dial error: %s", err)
	}
	defer conn.Close()

	client := pb.NewBookstoreClient(conn)

	ctx := context.Background()
	req := pb.ListBooksRequest{
		Filter: "book.page_count < 20",
	}
	for {
		resp, err := client.ListBooks(ctx, &req)
		if err != nil {
			log.Fatalf("list rpc error: %s", err)
		}

		for _, b := range resp.Books {
			log.Printf("title=%s author=%s pageCount=%d", b.Title, b.Author, b.PageCount)
		}

		if resp.NextPageToken == "" {
			break
		}
		req.PageToken = resp.NextPageToken
	}
}
