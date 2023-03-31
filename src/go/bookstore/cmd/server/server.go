package main

import (
	"context"
	"flag"
	"net"

	"github.com/google/cel-go/cel"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"google.golang.org/grpc/status"
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
	pb.RegisterBookstoreServer(s, newBookstoreService(logger))
	reflection.Register(s)

	l, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatal().Err(err).Msg("listen error")
	}

	if err := s.Serve(l); err != nil {
		log.Fatal().Err(err).Msg("serve error")
	}
}

type bookstoreService struct {
	logger zerolog.Logger
	data   []*pb.Book
}

func newBookstoreService(logger zerolog.Logger) *bookstoreService {
	return &bookstoreService{
		logger: logger,
		data: []*pb.Book{
			{Title: "title1", Author: "author1", PageCount: 10},
			{Title: "title2", Author: "author2", PageCount: 20},
			{Title: "title3", Author: "author3", PageCount: 30},
			{Title: "title4", Author: "author4", PageCount: 40},
			{Title: "title5", Author: "author5", PageCount: 50},
			{Title: "title6", Author: "author6", PageCount: 60},
		},
	}
}

func (s *bookstoreService) ListBooks(ctx context.Context, in *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
	s.logger.Info().
		Str("in.Filter", in.Filter).
		Int("in.PageSize", int(in.PageSize)).
		Str("in.PageToken", in.PageToken).
		Msg("ListBooksRequest")

	if in.Filter != "" {
		env, err := cel.NewEnv(
			cel.Variable("book", cel.DynType),
		)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "NewEnv error: %s", err)
		}

		ast, issues := env.Compile(in.Filter)
		if issues != nil && issues.Err() != nil {
			return nil, status.Errorf(codes.Internal, "Compile error: %s", err)
		}
		prg, err := env.Program(ast)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "program construction error: %s", err)
		}

		val, _, err := prg.Eval(map[string]any{
			"book": map[string]any{
				"page_count": 600,
			},
		})
		if err != nil {
			return nil, status.Errorf(codes.Internal, "eval error: %s", err)
		}

		s.logger.Info().Msgf("filter eval output: %#v", val)
	}

	switch in.PageToken {
	case "":
		s.logger.Info().Msg("returning first page")
		return &pb.ListBooksResponse{
			Books:         s.data[:3],
			NextPageToken: "secondPage",
		}, nil

	case "secondPage":
		s.logger.Info().Msg("returning second page")
		return &pb.ListBooksResponse{
			Books: s.data[3:],
		}, nil

	default:
		return nil, status.Error(codes.NotFound, "page not found")
	}
}
