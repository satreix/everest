package bookstore

import (
	"context"

	"github.com/rs/zerolog"
	"github.com/satreix/everest/src/go/bookstore/storage"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"go.einride.tech/aip/fieldbehavior"
	"go.einride.tech/aip/pagination"
	"google.golang.org/genproto/googleapis/api/annotations"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type BookstoreService struct {
	logger zerolog.Logger
	store  storage.Store
}

func NewBookstoreService(logger zerolog.Logger, store storage.Store) *BookstoreService {
	return &BookstoreService{
		logger: logger,
		store:  store,
	}
}

func (s *BookstoreService) ListBooks(ctx context.Context, req *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
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

	dbData, err := s.store.ListBooks(ctx, &storage.ListBooksRequest{
		Filter:   req.GetFilter(),
		Offset:   pageToken.Offset,
		PageSize: req.GetPageSize(),
	})
	if err != nil {
		return nil, status.Errorf(codes.Internal, "error reading data")
	}

	var data []*pb.Book
	for _, b := range dbData.Books {
		data = append(data, &pb.Book{
			Id:        b.ID,
			Title:     b.Title,
			Author:    b.Author,
			PageCount: int32(b.PageCount),
			Archived:  b.Archived,
		})
	}

	resp := &pb.ListBooksResponse{Books: data}
	if dbData.HasNextPage {
		resp.NextPageToken = pageToken.Next(req).String()
	}

	return resp, nil
}

func (s *BookstoreService) CreateBook(ctx context.Context, req *pb.CreateBookRequest) (*pb.Book, error) {
	fieldbehavior.ClearFields(req.GetBook(), annotations.FieldBehavior_OUTPUT_ONLY)

	createdBook, err := s.store.CreateBook(ctx, &storage.Book{
		Title:     req.Book.Title,
		Author:    req.Book.Author,
		PageCount: int(req.Book.PageCount),
		Archived:  req.Book.Archived,
	})
	if err != nil {
		s.logger.Error().Err(err).Msg("error creating book")
		return nil, status.Error(codes.Internal, "error creating book")
	}

	return &pb.Book{
		Id:        createdBook.ID,
		Title:     createdBook.Title,
		Author:    createdBook.Author,
		PageCount: int32(createdBook.PageCount),
		Archived:  createdBook.Archived,
	}, nil
}
