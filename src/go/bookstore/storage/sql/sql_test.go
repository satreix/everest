package sql

import (
	"context"
	"path/filepath"
	"testing"

	"github.com/rs/zerolog"
	"github.com/satreix/everest/src/go/bookstore/storage"
	"github.com/stretchr/testify/assert"
)

func Test_storage(t *testing.T) {
	logger := zerolog.New(zerolog.NewTestWriter(t))
	dbPath := filepath.Join(t.TempDir(), "data.sqlite")
	s, err := NewStore(logger, dbPath)
	assert.NoError(t, err)

	ctx := context.Background()
	createdBook, err := s.CreateBook(ctx, &storage.Book{
		Title:     "title1",
		Author:    "author1",
		PageCount: 42,
		Archived:  false,
	})
	assert.NoError(t, err)
	assert.NotEmpty(t, createdBook.ID)
	expectedBook := storage.Book{
		ID:        createdBook.ID,
		Title:     "title1",
		Author:    "author1",
		PageCount: 42,
		Archived:  false,
	}
	assert.Equal(t, &expectedBook, createdBook)

	resp, err := s.ListBooks(ctx, &storage.ListBooksRequest{
		Offset:   0,
		PageSize: 100,
	})
	assert.NoError(t, err)
	assert.Equal(t, []storage.Book{expectedBook}, resp.Books)
}
