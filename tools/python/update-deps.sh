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

# FIXME merge and deduplicate the output of the following commands to allow uing dev dependencies:
# - pipenv lock -r
# - pipenv lock -r --dev
if grep "\[dev-packages\]" Pipfile > /dev/null; then
    echo "Do not use [dev-packages] in Pipfile, use [packages] instead." 1>&2
    exit 1
fi

pipenv update
pipenv clean
pipenv lock -r > third_party/python/requirements.txt
