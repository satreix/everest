#!/usr/bin/env bash
set -euo pipefail

BAZEL="${BAZEL:-bazel}"

indent() {
  sed 's/^/  /'
}

log::info() {
  echo "INFO: $1" >&2
}

_linux_build_targets() {
  # targets that do not depend on swift and objc.

  # FIXME make filtering efficiant
  for elt in $($BAZEL query 'rdeps(//..., set(...)) except tests(//...)' 2> /dev/null); do
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
    $BAZEL query 'rdeps(//..., set(...)) except tests(//...)' 2> /dev/null
    ;;
  Linux)
    _linux_build_targets
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

  log::info "All $platform non test targets..."
  $BAZEL query 'rdeps(//..., set(...)) except tests(//...)' 2> /dev/null | indent

  log::info "Computing $platform non test targets..."
  targets="$(filter_targets "$platform")"
  echo "$targets" | indent

  log::info "Running $BAZEL..."
  echo "$targets" | xargs "$BAZEL" build
}

main
