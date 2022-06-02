#!/usr/bin/env bash
set -euo pipefail

section() {
    echo >&2 "===> $1"
}

section "Go"
touch src/proto/helloworld/empty.go
go mod tidy
rm src/proto/helloworld/empty.go
GO_DEPS_FILE="third_party/go/deps.bzl"
bazel run //:gazelle -- update-repos -from_file=go.mod -prune -to_macro "${GO_DEPS_FILE}%go_dependencies"
sed '/^$/d' "$GO_DEPS_FILE" >"${GO_DEPS_FILE}.new"
mv "${GO_DEPS_FILE}.new" "$GO_DEPS_FILE"
bazel run //:buildifier

section "Java"
echo >&2 "Manually update maven_install in WORKSPACE"
bazel run @unpinned_maven//:pin

section "Python"
./tools/python/update-deps.sh

section "Rust"
bazel run @cargo_raze//:raze -- --generate-lockfile --manifest-path=$(pwd)/Cargo.toml

./tools/format.sh
