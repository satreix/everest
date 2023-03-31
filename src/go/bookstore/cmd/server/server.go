package main

import (
	"context"
	"flag"
	"fmt"
	"net"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/common/operators"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
	"github.com/satreix/everest/src/go/logging"
	pb "github.com/satreix/everest/src/proto/bookstore/v1"
	exprpb "google.golang.org/genproto/googleapis/api/expr/v1alpha1"
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

	if err := s.Serve(l); err != nil {
		log.Fatal().Err(err).Msg("serve error")
	}
}

type bookstoreService struct {
	logger zerolog.Logger
	data   []*pb.Book
}

func newBookstoreService(logger zerolog.Logger) *bookstoreService {
	return &bookstoreService{
		logger: logger,
		data: []*pb.Book{
			{Title: "title1", Author: "author1", PageCount: 10},
			{Title: "title2", Author: "author2", PageCount: 20},
			{Title: "title3", Author: "author3", PageCount: 30},
			{Title: "title4", Author: "author4", PageCount: 40},
			{Title: "title5", Author: "author5", PageCount: 50},
			{Title: "title6", Author: "author6", PageCount: 60},
		},
	}
}

func (s *bookstoreService) ListBooks(ctx context.Context, in *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
	s.logger.Info().
		Str("in.Filter", in.Filter).
		Int("in.PageSize", int(in.PageSize)).
		Str("in.PageToken", in.PageToken).
		Msg("ListBooksRequest")

	var internalFilter func([]*pb.Book) []*pb.Book

	if in.Filter != "" {
		env, err := cel.NewEnv(
			cel.Variable("book", cel.DynType),
		)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "cel env creation error: %s", err)
		}

		ast, issues := env.Compile(in.Filter)
		if issues != nil && issues.Err() != nil {
			return nil, status.Errorf(codes.Internal, "compile error: %s", err)
		}

		s.logger.Info().Msg("ast compiled ok")

		checkedExpr, err := cel.AstToCheckedExpr(ast)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "convert to checkedExpr error: %s", err)
		}

		s.logger.Info().Msgf("checkedExpr: %#v", checkedExpr)

		c := &converter{
			logger: s.logger,
		}
		f, err := c.visit(checkedExpr.Expr)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "convert to internal filter error: %s", err)
		}

		s.logger.Info().Msgf("internal filter: %#v", c)
		internalFilter = func(books []*pb.Book) []*pb.Book {
			var out []*pb.Book
			for _, book := range books {
				if f(book) {
					out = append(out, book)
				}
			}
			return out
		}
	}

	output := s.data
	s.logger.Info().Str("output", fmt.Sprintf("%#v", output)).Msg("unfiltered output")

	if internalFilter != nil {
		output = internalFilter(output)
	}

	s.logger.Info().Str("output", fmt.Sprintf("%#v", output)).Msg("filtered output")

	// FIXME handle pagination
	return &pb.ListBooksResponse{Books: output}, nil
}

// converter convert an exprpb.Expression to a condition to apply on the returned book.
//
// WIP, inspired from cel2sql:
// https://github.com/cockscomb/cel2sql/blob/c803dfd5c44ce5c5865ea98999164f5d54985d39/cel2sql.go#L33
type converter struct {
	logger zerolog.Logger
}

func (c *converter) visit(expr *exprpb.Expr) (func(*pb.Book) bool, error) {
	switch t := expr.ExprKind.(type) {
	case *exprpb.Expr_CallExpr:
		return c.visitCall(expr)
	default:
		return nil, fmt.Errorf("not implemented: %#v", t)
	}
}

func (c *converter) visitCall(expr *exprpb.Expr) (func(*pb.Book) bool, error) {
	callExpr := expr.GetCallExpr()
	fun := callExpr.GetFunction()
	switch fun {
	//// ternary operator
	//case operators.Conditional:
	//	return c.visitCallConditional(expr)
	//// index operator
	//case operators.Index:
	//	return c.visitCallIndex(expr)
	//// unary operators
	//case operators.LogicalNot, operators.Negate:
	//	return c.visitCallUnary(expr)
	// binary operators
	case //operators.Add,
		//operators.Divide,
		//operators.Equals,
		//operators.Greater,
		//operators.GreaterEquals,
		//operators.In,
		//operators.Less,
		//operators.LessEquals,
		//operators.LogicalAnd,
		//operators.LogicalOr,
		//operators.Multiply,
		//operators.NotEquals,
		//operators.OldIn,
		//operators.Subtract
		operators.LessEquals:
		return c.visitCallBinary(expr)
	// standard function calls.
	default:
		return nil, fmt.Errorf("not implemented: %#v", fun)

		//return c.visitCallFunc(expr)
	}
}

func (c *converter) visitCallBinary(expr *exprpb.Expr) (func(*pb.Book) bool, error) {
	callExpr := expr.GetCallExpr()
	fun := callExpr.GetFunction()
	args := callExpr.GetArgs()
	lhs := args[0]
	rhs := args[1]

	c.logger.Info().
		Str("fun", fun).
		Str("lhs", fmt.Sprintf("%#v", lhs.ExprKind)).
		Str("rhs", fmt.Sprintf("%#v", rhs)).
		Msg("visitCallBinary")

	// FIXME this is not generic at all, implement the rest
	if _, ok := lhs.ExprKind.(*exprpb.Expr_SelectExpr); ok {
		if lhs.GetSelectExpr().GetOperand().GetIdentExpr().Name == "book" && lhs.GetSelectExpr().GetField() == "page_count" {
			return func(book *pb.Book) bool {
				condLHS := int64(book.GetPageCount())
				condRHS := rhs.GetConstExpr().GetInt64Value()
				return condLHS <= condRHS
			}, nil
		}
	}

	return nil, fmt.Errorf("not implemented")
}
