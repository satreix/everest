#!/usr/bin/env bash
# We use pipenv to manage Python dependenies.
#
# Currently Bazel python rules only support the requirements.txt file.
# Until rules_python support Pipfile, we convert the lock to a requirements.txt
# file manually.
#
# See:
# - https://github.com/bazelbuild/rules_python/issues/72
# - https://github.com/bazelbuild/rules_python/issues/171
set -euo pipefail

PYTHON_REQ_DIR="third_party/python"
REQS_FILE="${PYTHON_REQ_DIR}/requirements.txt"
LOCK_FILE="${PYTHON_REQ_DIR}/requirements_lock.txt"

pipenv check
pipenv install --dev
pipenv clean
pipenv lock --requirements --dev >"$REQS_FILE"
pipenv run pip-compile --quiet --output-file "$LOCK_FILE" "$REQS_FILE"
rm "$REQS_FILE"
