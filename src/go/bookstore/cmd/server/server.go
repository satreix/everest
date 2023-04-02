package main

import (
	"context"
	"flag"
	"fmt"
	"net"

	"github.com/google/cel-go/cel"
	"github.com/google/cel-go/checker/decls"
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
	}
}

func (s *bookstoreService) ListBooks(_ context.Context, in *pb.ListBooksRequest) (*pb.ListBooksResponse, error) {
	s.logger.Info().
		Str("in.Filter", in.Filter).
		Int("in.PageSize", int(in.PageSize)).
		Str("in.PageToken", in.PageToken).
		Msg("ListBooksRequest")

	var internalFilter func([]*pb.Book) []*pb.Book

	if in.Filter != "" {
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

		ast, issues := env.Compile(in.Filter)
		if issues != nil && issues.Err() != nil {
			return nil, status.Errorf(codes.Internal, "compile error: %s", issues.Err())
		}

		checkedExpr, err := cel.AstToCheckedExpr(ast)
		if err != nil {
			return nil, status.Errorf(codes.Internal, "convert to checkedExpr error: %s", err)
		}

		c := &converter{}
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
	if internalFilter != nil {
		output = internalFilter(output)
	}

	// FIXME handle pagination
	return &pb.ListBooksResponse{Books: output}, nil
}

// converter convert an exprpb.Expression to a condition to apply on the returned book.
//
// WIP, inspired from cel2sql:
// https://github.com/cockscomb/cel2sql/blob/c803dfd5c44ce5c5865ea98999164f5d54985d39/cel2sql.go#L33
type converter struct{}

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
		operators.Equals,
		operators.Greater,
		operators.GreaterEquals,
		//operators.In,
		operators.Less,
		operators.LessEquals,
		operators.LogicalAnd,
		operators.LogicalOr,
		//operators.Multiply,
		operators.NotEquals:
		//operators.OldIn,
		//operators.Subtract
		return c.visitCallBinary(expr)
	// standard function calls.
	default:
		return nil, fmt.Errorf("not implemented: %#v", fun)

		//return c.visitCallFunc(expr)
	}
}

var boolOps = map[string]func(a, b bool) bool{
	operators.Equals:    func(a, b bool) bool { return a == b },
	operators.NotEquals: func(a, b bool) bool { return a != b },
}

var int64Ops = map[string]func(a, b int64) bool{
	operators.Equals:        func(a, b int64) bool { return a == b },
	operators.Greater:       func(a, b int64) bool { return a > b },
	operators.GreaterEquals: func(a, b int64) bool { return a >= b },
	operators.Less:          func(a, b int64) bool { return a < b },
	operators.LessEquals:    func(a, b int64) bool { return a <= b },
	operators.NotEquals:     func(a, b int64) bool { return a != b },
}

func (c *converter) visitCallBinary(expr *exprpb.Expr) (func(*pb.Book) bool, error) {
	callExpr := expr.GetCallExpr()
	fun := callExpr.GetFunction()
	args := callExpr.GetArgs()
	lhs := args[0]
	rhs := args[1]

	if fun == operators.LogicalAnd {
		lhsFilter, err := c.visit(lhs)
		if err != nil {
			return nil, err
		}
		rhsFilter, err := c.visit(rhs)
		if err != nil {
			return nil, err
		}
		return func(book *pb.Book) bool { return lhsFilter(book) && rhsFilter(book) }, nil
	} else if fun == operators.LogicalOr {
		lhsFilter, err := c.visit(lhs)
		if err != nil {
			return nil, err
		}
		rhsFilter, err := c.visit(rhs)
		if err != nil {
			return nil, err
		}
		return func(book *pb.Book) bool { return lhsFilter(book) || rhsFilter(book) }, nil
	}

	// FIXME this is not generic at all, implement the rest

	if _, ok := lhs.ExprKind.(*exprpb.Expr_SelectExpr); !ok {
		return nil, fmt.Errorf("not implemented unless lhs is a SelectExpr")
	}
	if lhs.GetSelectExpr().GetOperand().GetIdentExpr().Name != "book" {
		return nil, fmt.Errorf("not implemented unless lhs is a SelectExpr on book")
	}

	// FIXME support all fields of the book type:
	// - [ ] string title
	// - [ ] string author
	// - [x] int32 page_count
	// - [x] bool archived
	switch lhs.GetSelectExpr().GetField() {
	case "page_count":
		op, ok := int64Ops[fun]
		if !ok {
			return nil, fmt.Errorf("not implemented unless func in in the supported ops")
		}

		if _, ok := rhs.ExprKind.(*exprpb.Expr_ConstExpr); !ok {
			return nil, fmt.Errorf("not implemented unless rhs is a ConstExpr")
		}
		if _, ok := rhs.GetConstExpr().ConstantKind.(*exprpb.Constant_Int64Value); !ok {
			return nil, fmt.Errorf("not implemented unless rhs is a ConstExpr.Int64Value")
		}

		return func(book *pb.Book) bool {
			condLHS := int64(book.GetPageCount())
			condRHS := rhs.GetConstExpr().GetInt64Value()
			return op(condLHS, condRHS)
		}, nil

	case "archived":
		op, ok := boolOps[fun]
		if !ok {
			return nil, fmt.Errorf("not implemented unless func in in the supported ops")
		}

		if _, ok := rhs.ExprKind.(*exprpb.Expr_ConstExpr); !ok {
			return nil, fmt.Errorf("not implemented unless rhs is a ConstExpr")
		}
		if _, ok := rhs.GetConstExpr().ConstantKind.(*exprpb.Constant_BoolValue); !ok {
			return nil, fmt.Errorf("not implemented unless rhs is a ConstExpr.BoolValue")
		}

		return func(book *pb.Book) bool {
			condLHS := book.GetArchived()
			condRHS := rhs.GetConstExpr().GetBoolValue()
			return op(condLHS, condRHS)
		}, nil

	default:
		return nil, fmt.Errorf("not implemented unless lhs is a SelectExpr on book.{page_count,archived}")
	}
}
