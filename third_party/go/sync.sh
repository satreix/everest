#!/bin/bash
set -eufo pipefail

empty_filename="empty.go"
trap 'find . -name "${empty_filename}" -delete' EXIT

{
    echo "package v1"
    echo 'import _ "github.com/gorilla/mux"'
} >"src/go/petstore/server/api/petstore/v1/${empty_filename}"

{
    echo "package v1"
    echo 'import _ "google.golang.org/genproto/googleapis/api/annotations"'
} >"src/proto/bookstore/v1/${empty_filename}"

{
    echo "package helloworld"
} >"src/proto/helloworld/${empty_filename}"

# The first time around `mod tidy` from bazel fails with "No sum for xxx found".
# (https://github.com/bazelbuild/bazel-gazelle/blob/1b331b6d9cb2d981580a8d3e2dfc551185790737/internal/bzlmod/go_deps.bzl#L583)
# So we call the non hermetic one first.
go mod tidy

bazel run @rules_go//go -- mod tidy -v
