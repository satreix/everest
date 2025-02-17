#!/bin/bash
set -eufo pipefail

section() {
    echo "===> $1" >&2
}

TOOLCHAINS=(
    go
    haskell
    java
    python
)

selected_toolchains=()
for toolchain in "$@"; do
    if [[ " ${TOOLCHAINS[@]} " =~ " ${toolchain} " ]]; then
        selected_toolchains+=("$toolchain")
    else
        echo "Unknown toolchain: $toolchain"
        echo "Known toolchains are: ${TOOLCHAINS[@]}"
        exit 1
    fi
done
if [[ ${#selected_toolchains[@]} -eq 0 ]]; then
    selected_toolchains=("${TOOLCHAINS[@]}")
fi

export REPIN=1

for toolchain in $(echo "${selected_toolchains[@]}" | tr ' ' '\n' | sort); do
    name="$(echo ${toolchain:0:1} | tr '[a-z]' '[A-Z]')${toolchain:1}"
    section "$name"
    "./third_party/${toolchain}/sync.sh"
done

./tools/format.sh
