#!/bin/bash
set -eufo pipefail

{
    echo "package v1"
    echo 'import _ "google.golang.org/genproto/googleapis/api/annotations"'
} >"src/proto/bookstore/v1/empty.go"

{
    echo "package helloworld"
} >"src/proto/helloworld/empty.go"

# The first time around `mod tidy` from bazel fails with "No sum for xxx found".
# (https://github.com/bazelbuild/bazel-gazelle/blob/1b331b6d9cb2d981580a8d3e2dfc551185790737/internal/bzlmod/go_deps.bzl#L583)
# So we call the non hermetic one first.
go mod tidy

bazel run @io_bazel_rules_go//go -- mod tidy -v

find src/proto -name empty.go -delete
