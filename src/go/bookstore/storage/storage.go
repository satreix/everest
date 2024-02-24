package storage

import "context"

type Store interface {
	CreateBook(context.Context, *Book) (*Book, error)
	ListBooks(context.Context, *ListBooksRequest) (*ListBooksResponse, error)
}

type ListBooksRequest struct {
	Filter   string
	Offset   int64
	PageSize int32
}

type ListBooksResponse struct {
	Books       []Book
	HasNextPage bool
}

type Book struct {
	ID        string
	Title     string
	Author    string
	PageCount int
	Archived  bool
}
