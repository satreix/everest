package bookstore

import (
	"context"
	"fmt"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
	"github.com/rs/zerolog"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"go.einride.tech/aip/pagination"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type BookstoreService struct {
	logger zerolog.Logger
	store  *storage
}

func NewBookstoreService(logger zerolog.Logger) *BookstoreService {
	return &BookstoreService{
		logger: logger,
		store:  new(storage),
	}
}

func (s *BookstoreService) ListBooks(_ context.Context, req *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
	const (
		maxPageSize     = 1000
		defaultPageSize = 100
	)
	switch {
	case req.PageSize < 0:
		return nil, status.Errorf(codes.InvalidArgument, "page size is negative")
	case req.PageSize == 0:
		req.PageSize = defaultPageSize
	case req.PageSize > maxPageSize:
		req.PageSize = maxPageSize
	}

	pageToken, err := pagination.ParsePageToken(req)
	if err != nil {
		return nil, status.Errorf(codes.InvalidArgument, "invalid page token")
	}

	data := s.store.ListBooks()
	if req.Filter != "" {
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

		ast, issues := env.Compile(req.Filter)
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

		internalFilter := func(books []*pb.Book) []*pb.Book {
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

		data = internalFilter(data)
	}

	// ---

	s.logger.Debug().
		Str("pageToken", fmt.Sprintf("%#v", pageToken)).
		Msg("pagination")

	var hasNextPage bool
	pageStart := int(pageToken.Offset)
	pageEnd := pageStart + int(req.PageSize)
	switch {
	case pageStart >= len(data):
		data = nil
		hasNextPage = false

	case pageEnd > len(data):
		data = data[pageStart:]
		hasNextPage = false

	default:
		data = data[pageStart:pageEnd]
		hasNextPage = true
	}

	// ----

	resp := &pb.ListBooksResponse{Books: data}
	if hasNextPage {
		resp.NextPageToken = pageToken.Next(req).String()
	}

	var titles []string
	for _, b := range data {
		titles = append(titles, b.Title)
	}
	s.logger.Info().Strs("title", titles).Msg("rpc response")

	return resp, nil
}

func (s *BookstoreService) CreateBook(_ context.Context, req *pb.CreateBookRequest) (*pb.Book, error) {
	createdBook, err := s.store.CreateBook(req.Book)
	if err != nil {
		s.logger.Error().Err(err).Msg("error creating book")
		return nil, status.Error(codes.Internal, "error creating book")
	}

	return createdBook, nil
}
