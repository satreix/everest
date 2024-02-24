package bookstore

import (
	"context"
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/rs/zerolog"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/testing/protocmp"
)

func Test_bookstoreService_ListBooks(t *testing.T) {
	logger := zerolog.New(zerolog.NewTestWriter(t))
	svc := NewBookstoreService(logger)
	svc.store = &storage{
		data: []*pb.Book{
			{Title: "title1", Author: "author1", PageCount: 10, Archived: false},
			{Title: "title2", Author: "author2", PageCount: 20, Archived: false},
			{Title: "title3", Author: "author3", PageCount: 30, Archived: false},
			{Title: "title4", Author: "author4", PageCount: 40, Archived: false},
			{Title: "title5", Author: "author5", PageCount: 50, Archived: true},
			{Title: "title6", Author: "author6", PageCount: 60, Archived: false},
		},
	}

	ctx := context.Background()
	req := pb.ListBooksRequest{
		Filter:   `book.page_count <= 20 || book.archived == true`,
		PageSize: 2,
	}
	resp1, err := svc.ListBooks(ctx, &req)
	assert.NoError(t, err)
	assert.Equal(t, []string{"title1", "title2"}, returnedTitles(resp1.Books))
	assert.NotEmpty(t, resp1.NextPageToken)

	req.PageToken = resp1.NextPageToken
	resp2, err := svc.ListBooks(ctx, &req)
	assert.NoError(t, err)
	assert.Equal(t, []string{"title5"}, returnedTitles(resp2.Books))
	assert.Empty(t, resp2.NextPageToken)
}

func Test_bookstoreService_CreateBook(t *testing.T) {
	logger := zerolog.New(zerolog.NewTestWriter(t))
	svc := NewBookstoreService(logger)
	assert.Empty(t, svc.store.data)

	ctx := context.Background()
	newBook, err := svc.CreateBook(ctx, &pb.CreateBookRequest{
		Book: &pb.Book{
			Title:     "title1",
			Author:    "author1",
			PageCount: 10,
			Archived:  false,
		},
	})
	assert.NoError(t, err)
	assert.NotEmpty(t, newBook.Id)

	expectedBook := &pb.Book{Id: newBook.Id, Title: "title1", Author: "author1", PageCount: 10, Archived: false}
	if diff := cmp.Diff(expectedBook, newBook, protocmp.Transform()); diff != "" {
		t.Fatalf("book mismatch (-want +got):\n%s", diff)
	}

	assert.Len(t, svc.store.data, 1)
	if diff := cmp.Diff(expectedBook, svc.store.data[0], protocmp.Transform()); diff != "" {
		t.Fatalf("book mismatch (-want +got):\n%s", diff)
	}

	assert.True(t, proto.Equal(expectedBook, svc.store.data[0]))
}

func returnedTitles(books []*pb.Book) (out []string) {
	for _, b := range books {
		out = append(out, b.Title)
	}
	return
}
