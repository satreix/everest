#!/bin/bash
set -eufo pipefail

poetry export > third_party/python/requirements_lock.txt
