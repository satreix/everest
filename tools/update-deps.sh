#!/usr/bin/env bash
set -euo pipefail

section() {
    echo "===> $1" >&2
}

export CARGO_BAZEL_REPIN=1
export REPIN=1

section "Go"
bazel run @go_sdk//:bin/go -- mod tidy -e
GO_DEPS_FILE="third_party/go/deps.bzl"
bazel run //:gazelle -- update-repos -from_file=go.mod -prune -to_macro "${GO_DEPS_FILE}%go_dependencies"
sed '/^$/d' "$GO_DEPS_FILE" >"${GO_DEPS_FILE}.new"
mv "${GO_DEPS_FILE}.new" "$GO_DEPS_FILE"
bazel run //:buildifier

section "Java"
bazel run @unpinned_maven//:pin

section "Python"
./tools/python/update-deps.sh

section "Rust"
bazel sync --only=crate_index

./tools/format.sh
