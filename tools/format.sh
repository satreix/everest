#!/usr/bin/env bash
set -euo pipefail

set -x

bazel build //tools/autoflake
AUTOFLAKE="./bazel-bin/tools/autoflake/autoflake"

bazel build //tools/isort
ISORT="./bazel-bin/tools/isort/isort"

bazel build //tools/yapf
YAPF="./bazel-bin/tools/yapf/yapf"

bazel build //tools/uncrustify
UNCRUSTIFY="./bazel-bin/tools/uncrustify/uncrustify/bin/uncrustify -c tools/uncrustify/uncrustify.cfg --no-backup --replace"

bazel build @com_google_google_java_format//:google-java-format
JAVAFORMAT="./bazel-bin/external/com_google_google_java_format/google-java-format --aosp --replace"

# C and Cpp
find . -type f -name '*.c' -print0 | xargs -0 $UNCRUSTIFY
find . -type f -name '*.cc' -print0 | xargs -0 $UNCRUSTIFY
find . -type f -name '*.h' -print0 | xargs -0 $UNCRUSTIFY
find . -type f -name '*.hh' -print0 | xargs -0 $UNCRUSTIFY

# Go
go fmt ./...
bazel run //:gazelle

# Java
# FIXME(sb) get google-java-format from WORKSPACE
find . -type f -name '*.java' -print0 | xargs -0 $JAVAFORMAT

# Python
find . -type f -iname '*.py' -print0 | xargs -0 "$AUTOFLAKE" --in-place --remove-unused-variables
find . -type f -iname '*.py' -print0 | xargs -0 "$ISORT"
find . -type f -iname '*.py' -print0 | xargs -0 "$YAPF" -i --no-local-style -p

# Rust
source $HOME/.cargo/env
cargo fmt

# Bazel
bazel run //:buildifier
