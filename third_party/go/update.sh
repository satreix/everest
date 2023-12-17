#!/bin/bash
set -eufo pipefail

proto_packages=(
    src/proto/bookstore/v1
    src/proto/helloworld
)

for pkg in "${proto_packages[@]}"; do
    echo "package $(basename "$pkg")" >"${pkg}/empty.go"
done

bazel run @go_sdk//:bin/go -- mod tidy

for pkg in "${proto_packages[@]}"; do
    rm -rf "${pkg}/empty.go"
done

GO_DEPS_FILE="third_party/go/deps.bzl"
bazel run //:gazelle -- update-repos \
    -build_file_proto_mode=disable_global \
    -from_file=go.mod \
    -prune \
    -to_macro="${GO_DEPS_FILE}%go_dependencies"
sed '/^$/d' "$GO_DEPS_FILE" >"${GO_DEPS_FILE}.new"
mv "${GO_DEPS_FILE}.new" "$GO_DEPS_FILE"
bazel run //:buildifier -- --lint=fix --warnings-all "$GO_DEPS_FILE"
