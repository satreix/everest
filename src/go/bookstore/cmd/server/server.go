package main

import (
	"flag"
	"net"

	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/bookstore"
	"github.com/satreix/everest/src/go/bookstore/storage"
	"github.com/satreix/everest/src/go/bookstore/storage/memory"
	"github.com/satreix/everest/src/go/bookstore/storage/sql"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	var addr string
	var sqliteFile string
	flag.StringVar(&addr, "addr", "localhost:50051", "grpc address")
	flag.StringVar(&sqliteFile, "database", "", "sqlite database file")
	debug := flag.Bool("debug", false, "sets log level to debug")
	flag.Parse()

	logger, err := logging.SetupLogger(*debug)
	if err != nil {
		log.Fatal().
			Err(err).
			Msg("Logger setup error")
	}

	var store storage.Store
	if sqliteFile != "" {
		store, err = sql.NewStore(logger, sqliteFile)
		if err != nil {
			log.Fatal().Err(err).Msg("error in database init")
		}
	} else {
		store = memory.NewStore()
	}

	s := grpc.NewServer(
		grpc.ChainUnaryInterceptor(
			logging.UnaryServerInterceptor(logger),
		),
		grpc.ChainStreamInterceptor(
			logging.StreamServerInterceptor(logger),
		),
	)
	pb.RegisterBookstoreServer(s, bookstore.NewBookstoreService(logger, store))
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
