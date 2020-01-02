#!/usr/bin/env bash
set -euo pipefail

h1() {
  echo "---> $1" >&2
}

log::_log() {
  echo "$1" >&2
}

log::error() {
  log::_log "\033[1m$1\033[0m"
}

binary_exist() {
  command -v "$1" > /dev/null
}

SILENT_BUILD="--experimental_ui_limit_console_output=1"

bazel build $SILENT_BUILD //tools/autoflake
AUTOFLAKE="./bazel-bin/tools/autoflake/autoflake"

bazel build $SILENT_BUILD //tools/isort
ISORT="./bazel-bin/tools/isort/isort"

bazel build $SILENT_BUILD //tools/yapf
YAPF="./bazel-bin/tools/yapf/yapf"

bazel build $SILENT_BUILD //tools/uncrustify
UNCRUSTIFY=(./bazel-bin/tools/uncrustify/uncrustify/bin/uncrustify -c tools/uncrustify/uncrustify.cfg --no-backup --replace)

bazel build $SILENT_BUILD @com_google_google_java_format//:google-java-format
JAVAFORMAT=(./bazel-bin/external/com_google_google_java_format/google-java-format --aosp --replace)

h1 "C and Cpp"
find . -type f \( -name '*.c' -o -name '*.cc' -o -name '*.h' -o -name '*.hh' \) -print0 | xargs -0 "${UNCRUSTIFY[@]}"

h1 "Go"
go fmt ./...
bazel run $SILENT_BUILD //:gazelle

h1 "Java"
find . -type f -name '*.java' -print0 | xargs -0 "${JAVAFORMAT[@]}"

h1 "Objective-C"
find . -type f -name '*.m' -print0 | xargs -0 "${UNCRUSTIFY[@]}"

h1 "Python"
find . -type f -iname '*.py' -print0 | xargs -0 "$AUTOFLAKE" --in-place --remove-unused-variables
find . -type f -iname '*.py' -print0 | xargs -0 "$ISORT"
find . -type f -iname '*.py' -print0 | xargs -0 "$YAPF" -i --no-local-style -p

h1 "Rust"
# FIXME use cargo-fmt from WORKSPACE
if binary_exist cargo; then
  cargo fmt
else
  log::error "Install cargo to format Rust files: https://github.com/rust-lang/cargo"
fi

h1 "Shell"
# FIXME use shellcheck from WORKSPACE
if binary_exist shellcheck; then
  find . -type f \( -name '*.bash' -o -name '*.sh' \) -print0 | xargs -0 shellcheck
else
  log::error "Install shellcheck to format shell files: https://github.com/koalaman/shellcheck"
fi

h1 "Swift"
if binary_exist swift-format; then
  find . -type f -name '*.swift' -print0 | xargs -0 swift-format --in-place
else
  log::error "Install swift-format to format Swift files: https://github.com/apple/swift-format"
fi

h1 "Starlark"
bazel run $SILENT_BUILD //:buildifier
