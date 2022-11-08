#!/bin/bash
set -eufo pipefail

section() {
    echo "===> $1" >&2
}

LANGUAGES=(
    go
    haskell
    java
    python
    rust
)

export CARGO_BAZEL_REPIN=1
export REPIN=1

for lang in "${LANGUAGES[@]}"; do
    name="$(echo ${lang:0:1} | tr '[a-z]' '[A-Z]')${lang:1}"
    section "$name"
    chmod +x "./third_party/${lang}/update.sh"
    "./third_party/${lang}/update.sh"
done

./tools/format.sh
