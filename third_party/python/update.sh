#!/bin/bash
set -eufo pipefail

bazel build tools/pipenv
PIPENV="$(bazel cquery --output=files tools/pipenv | grep -v '\.py$')"

$PIPENV install --dev
$PIPENV clean
$PIPENV lock

$PIPENV requirements --dev >third_party/python/requirements.txt
$PIPENV run pip-compile \
    --allow-unsafe \
    --generate-hashes \
    --output-file=third_party/python/requirements_lock.txt \
    third_party/python/requirements.txt
rm third_party/python/requirements.txt
