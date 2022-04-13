#!/bin/bash
set -eufo pipefail

set -x

bazel build \
    -k \
    --experimental_action_listener=@io_kythe//:extract_kzip_go \
    --experimental_extra_action_top_level_only \
    //src/go/hello_world/...
