#!/bin/bash
set -eufo pipefail

bazel run @stackage-unpinned//:pin
