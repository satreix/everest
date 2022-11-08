#!/bin/bash
set -eufo pipefail

export REPIN=1
bazel run @unpinned_maven//:pin
