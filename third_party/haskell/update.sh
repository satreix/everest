#!/bin/bash
set -eufo pipefail

bazel run @@rules_haskell~0.18~stack_snapshot~stackage-unpinned//:pin
mv stackage_snapshot.json third_party/haskell/stackage_snapshot.json
