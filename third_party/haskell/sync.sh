#!/bin/bash
set -eufo pipefail

bazel run @@rules_haskell~~stack_snapshot~stackage-unpinned//:pin
