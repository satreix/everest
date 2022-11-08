#!/bin/bash
set -eufo pipefail

bazel run @go_sdk//:bin/go -- mod tidy -e
GO_DEPS_FILE="third_party/go/deps.bzl"
bazel run //:gazelle -- update-repos -from_file=go.mod -prune -to_macro "${GO_DEPS_FILE}%go_dependencies"
sed '/^$/d' "$GO_DEPS_FILE" >"${GO_DEPS_FILE}.new"
mv "${GO_DEPS_FILE}.new" "$GO_DEPS_FILE"
bazel run //:buildifier -- --lint=fix --warnings-all "$GO_DEPS_FILE"
