#!/bin/bash
set -eufo pipefail

uv export --no-header >third_party/python/requirements_lock.txt
