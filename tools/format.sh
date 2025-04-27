#!/usr/bin/env bash
set -euo pipefail

AUTOFLAKE="$(bazel run --run_under='echo' //tools/autoflake)"
BLACK="$(bazel run --run_under='echo' //tools/black)"
GOFUMPT="$(bazel run --run_under=echo @cc_mvdan_gofumpt//:gofumpt)"
ISORT="$(bazel run --run_under='echo' //tools/isort)"
JAVAFORMAT="$(bazel run --run_under='echo' //tools/google-java-format)"
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
./src/go/petstore/server/api/petstore/regen.sh
find . -type f -name '*.go' -print0 | xargs -0 "$GOFUMPT" -w
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
bundle exec rubocop --autocorrect-all
popd

# Rust
bazel run @rules_rust//:rustfmt

# Shell
find . -type f -name '*.sh' -print0 | xargs -0 "$SHFMT" -i=4 -s -w

# Bazel
bazel mod tidy
bazel run //:buildifier
