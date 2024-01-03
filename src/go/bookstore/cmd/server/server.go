package main

import (
	"context"
	"flag"
	"net"
	"sync"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
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

	log.Info().Str("addr", addr).Msg("Server listenning.")

	if err := s.Serve(l); err != nil {
		log.Fatal().Err(err).Msg("serve error")
	}
}

type bookstoreService struct {
	logger zerolog.Logger

	dataLock sync.RWMutex
	data     []*pb.Book
}

func newBookstoreService(logger zerolog.Logger) *bookstoreService {
	return &bookstoreService{
		logger: logger,
	}
}

func (s *bookstoreService) ListBooks(_ context.Context, in *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
	var internalFilter func([]*pb.Book) []*pb.Book
	if in.Filter != "" {
		env, err := cel.NewEnv(
			cel.Types(
				new(pb.Book),
			),
			cel.Declarations(
				decls.NewConst("book", decls.NewObjectType("bookstore.v1.Book"), nil),
			),
		)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "cel env creation error: %s", err)
		}

		ast, issues := env.Compile(in.Filter)
		if issues != nil && issues.Err() != nil {
			return nil, status.Errorf(codes.Internal, "compile error: %s", issues.Err())
		}

		program, err := env.Program(ast)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "convert to load program: %s", err)
		}

		filterFunc := func(book *pb.Book) bool {
			result, _, err := program.Eval(map[string]any{
				"book": book,
			})
			if err != nil {
				return false
			}
			val, ok := result.Value().(bool)
			if !ok {
				return false
			}
			return val
		}

		internalFilter = func(books []*pb.Book) []*pb.Book {
			var out []*pb.Book
			for _, book := range books {
				if filterFunc(book) {
					out = append(out, &pb.Book{
						Title:     book.GetTitle(),
						Author:    book.GetAuthor(),
						PageCount: book.GetPageCount(),
						Archived:  book.GetArchived(),
					})
				}
			}
			return out
		}
	}

	s.dataLock.RLock()
	defer s.dataLock.RUnlock()

	output := s.data
	if internalFilter != nil {
		output = internalFilter(output)
	}

	// FIXME handle pagination
	return &pb.ListBooksResponse{Books: output}, nil
}

func (s *bookstoreService) CreateBook(_ context.Context, in *pb.CreateBookRequest) (*pb.Book, error) {
	s.dataLock.Lock()
	defer s.dataLock.Unlock()

	s.data = append(s.data, in.Book)
	return in.Book, nil
}
