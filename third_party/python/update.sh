#!/bin/bash
set -eufo pipefail

pipenv check
pipenv install --dev
pipenv clean
pipenv lock

PY_BZL_FILE="third_party/python/requirements.bzl"
bazel run //third_party/python:pipefile_lock_to_bzl -- \
    --namespace=pypi \
    --output="$PY_BZL_FILE" \
    Pipfile.lock
bazel run //:buildifier -- --lint=fix --warnings-all "$PY_BZL_FILE"
