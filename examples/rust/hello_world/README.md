# Hello World in Rust

## Update dependencies

This part of the repo uses [cargo-raze](https://github.com/google/cargo-raze).
If you need to update the dependencies:

```console
$ rm -rf remote crates.bzl
$ cargo raze
# move the content of BUILD into BUILD.bazel
$ rm BUILD
```
