package main

import (
	"context"
	"testing"

	"github.com/rs/zerolog"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"github.com/stretchr/testify/assert"
	"google.golang.org/protobuf/proto"
)

func Test_bookstoreService_ListBooks(t *testing.T) {
	logger := zerolog.New(zerolog.NewTestWriter(t))
	svc := newBookstoreService(logger)
	svc.data = []*pb.Book{
		{Title: "title1", Author: "author1", PageCount: 10, Archived: false},
		{Title: "title2", Author: "author2", PageCount: 20, Archived: false},
		{Title: "title3", Author: "author3", PageCount: 30, Archived: false},
		{Title: "title4", Author: "author4", PageCount: 40, Archived: false},
		{Title: "title5", Author: "author5", PageCount: 50, Archived: true},
		{Title: "title6", Author: "author6", PageCount: 60, Archived: false},
	}

	ctx := context.Background()
	resp, err := svc.ListBooks(ctx, &pb.ListBooksRequest{
		Filter: `book.page_count <= 20 || book.archived == true`,
	})
	assert.NoError(t, err)
	assert.Equal(t, &pb.ListBooksResponse{
		Books: []*pb.Book{
			{Title: "title1", Author: "author1", PageCount: 10, Archived: false},
			{Title: "title2", Author: "author2", PageCount: 20, Archived: false},
			{Title: "title5", Author: "author5", PageCount: 50, Archived: true},
		},
	}, resp)
}

func Test_bookstoreService_CreateBook(t *testing.T) {
	logger := zerolog.New(zerolog.NewTestWriter(t))
	svc := newBookstoreService(logger)
	assert.Empty(t, svc.data)

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

	expectedBook := &pb.Book{Title: "title1", Author: "author1", PageCount: 10, Archived: false}
	assert.True(t, proto.Equal(expectedBook, newBook))
	assert.Len(t, svc.data, 1)
	assert.True(t, proto.Equal(expectedBook, svc.data[0]))
}
