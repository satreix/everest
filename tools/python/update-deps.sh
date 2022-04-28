#!/usr/bin/env bash
set -euo pipefail

PL2B="$(bazel run --run_under=echo //tools/python:pipefile_lock_to_bzl)"

pipenv check
pipenv install --dev
pipenv clean
pipenv lock
"$PL2B" --namespace=pypi Pipfile.lock >"third_party/python/requirements.bzl"
