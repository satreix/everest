#!/usr/bin/env bash
set -euo pipefail

section() {
    echo >&2 "===> $1"
}

section "Go"
go mod tidy
bazel run //:gazelle -- update-repos -from_file=go.mod -prune -to_macro third_party/go/deps.bzl%go_dependencies

section "Java"
echo >&2 "Manually update maven_install in WORKSPACE"
bazel run @unpinned_maven//:pin

section "Python"
./tools/python/update-deps.sh

section "Rust"
bazel run @cargo_raze//:raze -- --manifest-path=$(pwd)/Cargo.toml

./tools/format.sh
