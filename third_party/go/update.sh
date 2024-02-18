#!/bin/bash
set -eufo pipefail

{
    echo "package v1"
    echo 'import _ "google.golang.org/genproto/googleapis/api/annotations"'
} > "src/proto/bookstore/v1/empty.go"

{
    echo "package helloworld"
} > "src/proto/helloworld/empty.go"


bazel run @io_bazel_rules_go//go -- mod tidy -v

find src/proto -name empty.go -delete
