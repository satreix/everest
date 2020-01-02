#!/usr/bin/env bash
set -euo pipefail

BAZEL="${BAZEL:-bazel}"

indent() {
  sed 's/^/  /'
}

log::info() {
  echo "INFO: $1" >&2
}

_linux_test_targets() {
  # FIXME make filtering efficiant
  for elt in $($BAZEL query 'tests(//...)' 2> /dev/null); do
    ignore=false

    for lang in objc swift; do
      if [[ $($BAZEL query "kind(${lang}_.*, $elt)" 2> /dev/null) ]]; then
        ignore=true
        break
      fi

      if [[ $($BAZEL query "kind(${lang}_.*, deps($elt))" 2> /dev/null) ]]; then
        ignore=true
        break
      fi
    done

    if [ "$ignore" = true ] ; then
      continue
    fi

    echo "$elt"
  done
}

filter_targets() {
  local platform=$1

  case "$platform" in
  Darwin)
    $BAZEL query 'tests(//...)' 2> /dev/null
    ;;
  Linux)
    _linux_test_targets
    ;;
  *)
    echo "unsupported platform: $platform" >&2
    exit 1
    ;;
  esac
}

main() {
  local platform
  platform="$(uname)"

  log::info "All $platform test targets..."
  $BAZEL query 'tests(//...)' | indent

  log::info "Computing $platform testable targets..."
  targets="$(filter_targets "$platform")"
  echo "$targets" | indent

  log::info "Running $BAZEL..."
  echo "$targets" | xargs "$BAZEL" test
}

main
