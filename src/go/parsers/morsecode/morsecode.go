package morsecode

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/antlr/antlr4/runtime/Go/antlr"
)

func Parse(data string) (string, error) {
	input := antlr.NewInputStream(data)
	lexer := NewmorsecodeLexer(input)
	stream := antlr.NewCommonTokenStream(lexer, 0)
	p := NewmorsecodeParser(stream)
	el := new(errorListener)
	p.AddErrorListener(el)
	p.BuildParseTrees = true
	tree := p.Morsecode()

	if err := el.Error(); err != nil {
		return "", err
	}

	return tree.ToStringTree(nil, p), nil
}

type errorListener struct {
	*antlr.DefaultErrorListener
	errors []string
}

func (e *errorListener) SyntaxError(_ antlr.Recognizer, _ interface{}, line, column int, msg string, _ antlr.RecognitionException) {
	e.errors = append(e.errors, "line "+strconv.Itoa(line)+":"+strconv.Itoa(column)+" "+msg)
}

func (e *errorListener) Error() error {
	if len(e.errors) == 0 {
		return nil
	}

	return fmt.Errorf("parsing errors:\n%s", strings.Join(e.errors, "\n"))
}
