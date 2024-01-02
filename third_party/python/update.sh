#!/bin/bash
set -eufo pipefail

pipenv install --dev
pipenv clean
pipenv lock

pipenv requirements --dev > third_party/python/requirements.txt
pipenv run pip-compile --generate-hashes --output-file=third_party/python/requirements_lock.txt third_party/python/requirements.txt
rm third_party/python/requirements.txt
