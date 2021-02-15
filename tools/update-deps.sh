#!/usr/bin/env bash
set -euo pipefail

section() {
    echo "===> $1"
}

section "Go"
go mod tidy
bazel run //:gazelle -- update-repos -from_file=go.mod -prune -to_macro deps.bzl%dependencies

section "Java"
echo "Manually update maven_install in WORKSPACE"
bazel run @unpinned_maven//:pin

section "Python"
./tools/python/update-deps.sh

section "Rust"
echo "Read how to update rust dependencies in examples/rust/hello_world/README.md"
