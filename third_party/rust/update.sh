#!/bin/bash
set -eufo pipefail

export CARGO_BAZEL_REPIN=1
bazel sync --only=crate_index
