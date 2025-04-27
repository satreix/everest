package main

import (
	"bytes"
	"flag"
	"fmt"
	"go/ast"
	"go/parser"
	"go/printer"
	"go/token"
	"os"
	"strings"
)

func main() {
	var (
		filePath     = flag.String("file", "", "Path to the Go file")
		addImports   = flag.String("add", "", "Comma-separated imports to add (e.g., \"fmt,errors\")")
		removeImports = flag.String("remove", "", "Comma-separated imports to remove (e.g., \"fmt,errors\")")
	)
	flag.Parse()

	if *filePath == "" {
		fmt.Fprintln(os.Stderr, "error: --file is required")
		os.Exit(1)
	}

	fset := token.NewFileSet()
	node, err := parser.ParseFile(fset, *filePath, nil, parser.ParseComments)
	if err != nil {
		fmt.Fprintf(os.Stderr, "failed to parse file: %v\n", err)
		os.Exit(1)
	}

	if *addImports != "" {
		for _, imp := range splitList(*addImports) {
			addImportToFile(node, imp)
		}
	}
	if *removeImports != "" {
		for _, imp := range splitList(*removeImports) {
			removeImportFromFile(node, imp)
		}
	}

	var buf bytes.Buffer
	if err := printer.Fprint(&buf, fset, node); err != nil {
		fmt.Fprintf(os.Stderr, "failed to print file: %v\n", err)
		os.Exit(1)
	}

	if err := os.WriteFile(*filePath, buf.Bytes(), 0644); err != nil {
		fmt.Fprintf(os.Stderr, "failed to write file: %v\n", err)
		os.Exit(1)
	}
}

func splitList(s string) []string {
	parts := strings.Split(s, ",")
	var trimmed []string
	for _, part := range parts {
		if p := strings.TrimSpace(part); p != "" {
			trimmed = append(trimmed, p)
		}
	}
	return trimmed
}

func addImportToFile(f *ast.File, path string) {
	// Check if already imported
	for _, imp := range f.Imports {
		if strings.Trim(imp.Path.Value, "\"") == path {
			return
		}
	}

	newImport := &ast.ImportSpec{
		Path: &ast.BasicLit{
			Kind:  token.STRING,
			Value: fmt.Sprintf("\"%s\"", path),
		},
	}

	// Insert into the first import block if it exists
	for _, decl := range f.Decls {
		if gen, ok := decl.(*ast.GenDecl); ok && gen.Tok == token.IMPORT {
			gen.Specs = append(gen.Specs, newImport)
			return
		}
	}

	// Otherwise, create a new import block
	f.Decls = append([]ast.Decl{&ast.GenDecl{
		Tok:   token.IMPORT,
		Specs: []ast.Spec{newImport},
	}}, f.Decls...)
}

func removeImportFromFile(f *ast.File, path string) {
	for _, decl := range f.Decls {
		gen, ok := decl.(*ast.GenDecl)
		if !ok || gen.Tok != token.IMPORT {
			continue
		}
		newSpecs := []ast.Spec{}
		for _, spec := range gen.Specs {
			impSpec := spec.(*ast.ImportSpec)
			if strings.Trim(impSpec.Path.Value, "\"") != path {
				newSpecs = append(newSpecs, impSpec)
			}
		}
		gen.Specs = newSpecs
	}
}
