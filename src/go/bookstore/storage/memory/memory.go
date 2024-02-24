package memory

import (
	"context"
	"sync"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
	"github.com/google/uuid"
	"github.com/satreix/everest/src/go/bookstore/storage"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type store struct {
	dataLock sync.RWMutex
	data     []storage.Book
}

func NewStore() *store {
	return new(store)
}

func (s *store) CreateBook(_ context.Context, book *storage.Book) (*storage.Book, error) {
	s.dataLock.Lock()
	defer s.dataLock.Unlock()

	book.ID = uuid.New().String()

	s.data = append(s.data, *book)
	return book, nil
}

func (s *store) ListBooks(_ context.Context, req *storage.ListBooksRequest) (*storage.ListBooksResponse, error) {
	s.dataLock.RLock()
	defer s.dataLock.RUnlock()

	data := s.data
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

		internalFilter := func(books []storage.Book) (out []storage.Book) {
			for _, b := range books {
				pbBook := &pb.Book{
					Id:        b.ID,
					Title:     b.Title,
					Author:    b.Author,
					PageCount: int32(b.PageCount),
					Archived:  b.Archived,
				}
				if filterFunc(pbBook) {
					out = append(out, b)
				}
			}
			return
		}

		data = internalFilter(data)
	}

	var hasNextPage bool
	pageStart := int(req.Offset)
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

	// This is probably externally mutable and horrible.
	return &storage.ListBooksResponse{
		Books:       data,
		HasNextPage: hasNextPage,
	}, nil
}
