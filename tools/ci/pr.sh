#!/bin/bash
set -eufo pipefail

CI=${CI:-false}
if [ "$CI" = true ] ; then
    BAZEL="./bin/bazel"
    BAZEL_CMD_ARGS="--remote_header=x-buildbuddy-api-key=$BUILDBUDDY_API_KEY"
else
    BAZEL="bazel"
    BAZEL_CMD_ARGS=""
fi

$BAZEL build $BAZEL_CMD_ARGS //src/go/ci/driver
DRIVER="$($BAZEL cquery $BAZEL_CMD_ARGS --output=files //src/go/ci/driver)"
"$DRIVER" -bazel "$BAZEL" main
