#!/bin/bash
set -eufo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# installed with: brew install gfortran
set -x
gfortran -o "$SCRIPT_DIR/hello-world" "$SCRIPT_DIR/main.f90"
