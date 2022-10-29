#!/usr/bin/env bash
set -eufo pipefail

pipenv check
pipenv install --dev
pipenv clean
pipenv lock
bazel run //tools/python:pipefile_lock_to_bzl -- \
    --namespace=pypi \
    --output=third_party/python/requirements.bzl \
    Pipfile.lock
