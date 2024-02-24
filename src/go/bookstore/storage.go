package bookstore

import (
	"sync"

	"github.com/google/uuid"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
)

type storage struct {
	dataLock sync.RWMutex
	data     []*pb.Book
}

func (s *storage) CreateBook(book *pb.Book) (*pb.Book, error) {
	s.dataLock.Lock()
	defer s.dataLock.Unlock()

	book.Id = uuid.New().String()

	s.data = append(s.data, book)
	return book, nil
}

func (s *storage) ListBooks() []*pb.Book {
	s.dataLock.RLock()
	defer s.dataLock.RUnlock()

	// This is probably externally mutable and horrible.
	return s.data
}
