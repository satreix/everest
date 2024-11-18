#!/bin/bash
set -eufo pipefail

export RULES_JVM_EXTERNAL_REPIN=1
bazel run @unpinned_maven//:pin
