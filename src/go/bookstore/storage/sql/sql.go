package sql

import (
	"context"
	"fmt"
	"strconv"
	"strings"

	"github.com/cockscomb/cel2sql"
	_ "github.com/cockscomb/cel2sql"
	"github.com/cockscomb/cel2sql/sqltypes"
	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
	"github.com/rs/zerolog"
	"github.com/satreix/everest/src/go/bookstore/storage"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type Book struct {
	gorm.Model
	Title     string
	Author    string
	PageCount int
	Archived  bool
}

type store struct {
	db     *gorm.DB
	logger zerolog.Logger
}

func NewStore(logger zerolog.Logger, path string) (*store, error) {
	db, err := gorm.Open(sqlite.Open(path), &gorm.Config{})
	if err != nil {
		return nil, fmt.Errorf("error openning the database: %w", err)
	}

	if err := db.AutoMigrate(&Book{}); err != nil {
		return nil, fmt.Errorf("error migrating the database: %w", err)
	}

	return &store{
		db:     db,
		logger: logger,
	}, nil
}

func (s *store) CreateBook(ctx context.Context, book *storage.Book) (*storage.Book, error) {
	b := bookStorage2Db(*book)
	result := s.db.WithContext(ctx).Create(&b)
	if err := result.Error; err != nil {
		return nil, err
	}

	createdBook := bookDb2Storage(b)
	return &createdBook, nil
}

func (s *store) ListBooks(ctx context.Context, req *storage.ListBooksRequest) (*storage.ListBooksResponse, error) {
	dbRequest := s.db.WithContext(ctx).
		Order("title, id").
		Offset(int(req.Offset)).
		Limit(int(req.PageSize))

	if req.Filter != "" {
		env, err := cel.NewEnv(
			cel.Types(
				new(pb.Book),
			),
			sqltypes.SQLTypeDeclarations,
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

		sqlCondition, err := cel2sql.Convert(ast)
		if err != nil {
			return nil, fmt.Errorf("cel2sql convert error: %w", err)
		}

		sqlCondition = strings.ReplaceAll(sqlCondition, "`book`", "`books`")

		s.logger.Info().Str("sqlCondition", sqlCondition).Msg("cel2sql sqlCondition")

		// FIXME investigate https://github.com/pilagod/gorm-cursor-paginator/tree/v1 for cursor based pagination
		dbRequest = dbRequest.Where(sqlCondition)
	}

	var books []Book
	if err := dbRequest.Find(&books).Error; err != nil {
		return nil, err
	}

	var output []storage.Book
	for _, b := range books {
		output = append(output, bookDb2Storage(b))
	}
	return &storage.ListBooksResponse{
		Books:       output,
		HasNextPage: int32(len(output)) == req.PageSize,
	}, nil
}

// FIXME investigate https://github.com/rafiulgits/go-automapper for mapping structures

func bookDb2Storage(b Book) storage.Book {
	return storage.Book{
		ID:        strconv.Itoa(int(b.Model.ID)),
		Title:     b.Title,
		Author:    b.Author,
		PageCount: b.PageCount,
		Archived:  b.Archived,
	}
}

func bookStorage2Db(b storage.Book) Book {
	return Book{
		Title:     b.Title,
		Author:    b.Author,
		PageCount: b.PageCount,
		Archived:  b.Archived,
	}
}
