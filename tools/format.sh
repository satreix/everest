#!/usr/bin/env bash
set -euo pipefail

AUTOFLAKE="$(bazel run --run_under='echo' //tools/autoflake)"
BLACK="$(bazel run --run_under='echo' //tools/black)"
GOIMPORTS="$(bazel run --run_under=echo @org_golang_x_tools//cmd/goimports)"
GOIMPORTSORT=$(bazel run --run_under=echo @com_github_aristanetworks_goarista//cmd/importsort)
ISORT="$(bazel run --run_under='echo' //tools/isort)"
JAVAFORMAT="$(bazel run --run_under='echo' @com_google_google_java_format//:google-java-format)"
SHFMT="$(bazel run --run_under=echo @com_github_mvdan_sh//cmd/shfmt)"

# We cannot use run_under here because of https://github.com/bazelbuild/rules_foreign_cc/issues/582
bazel build //tools/uncrustify
UNCRUSTIFY="./bazel-bin/tools/uncrustify/uncrustify/bin/uncrustify"

# C and Cpp
cpp_patterns=('*.c' '*.cc' '*.h' '*.hh')
for pattern in "${cpp_patterns[@]}"; do
    find . -type f -name "$pattern" -print0 | xargs -0 "$UNCRUSTIFY" -c tools/uncrustify/uncrustify.cfg --no-backup --replace
done

# Go
find . -type f -name '*.go' -print0 | xargs -0 "$GOIMPORTS" -w
find . -type f -name '*.go' -print0 | xargs -0 "$GOIMPORTSORT" -s UNDEFINED -w
bazel run //:gazelle

# Java
find . -type f -name '*.java' -print0 | xargs -0 "$JAVAFORMAT" --aosp --replace

# Python
find . -type f -iname '*.py' -print0 | xargs -0 "$AUTOFLAKE" --in-place --remove-unused-variables
find . -type f -iname '*.py' -print0 | xargs -0 "$ISORT"
find . -type f -iname '*.py' -print0 | xargs -0 "$BLACK"

# Ruby
# FIXME rubocop does not work in Bazel yet
bundle install
pushd src/ruby
bundle exec rubocop --auto-correct-all
popd

# Rust
bazel run @rules_rust//:rustfmt

# Shell
find . -type f -name '*.sh' -print0 | xargs -0 "$SHFMT" -i=4 -s -w

# Bazel
bazel run //:buildifier
