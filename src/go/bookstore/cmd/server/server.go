package main

import (
	"flag"
	"net"

	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/bookstore"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	var addr string
	flag.StringVar(&addr, "addr", "localhost:50051", "grpc address")
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
	pb.RegisterBookstoreServer(s, bookstore.NewBookstoreService(logger))
	reflection.Register(s)

	l, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatal().Err(err).Msg("listen error")
	}

	log.Info().Str("addr", addr).Msg("Server listenning.")

	if err := s.Serve(l); err != nil {
		log.Fatal().Err(err).Msg("serve error")
	}
}
