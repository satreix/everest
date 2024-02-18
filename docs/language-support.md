# Language support

We looked at the [TIOBE language index][] for November 2022 and listed them here with their [Bazel][], [gRPC][], and [Kythe][] support.

Languages that we do not plan to support are omitted.

| Rank | Language | Bazel | gRPC | Kythe |
|------|----------|-------|------|-------|
| 1 | [Python](/src/python) | [✅](https://github.com/bazelbuild/rules_python) | [✅](https://grpc.io/docs/languages/python/quickstart/) | [✅](https://github.com/google/pytype/tree/main/pytype/tools/xref) |
| 2 | C | [✅](https://github.com/bazelbuild/rules_cc) | 🟧 [binding](https://github.com/juniper/grpc-c) | |
| 3 | [Java](/src/java) | [✅](https://github.com/bazelbuild/rules_java) | [✅](https://grpc.io/docs/languages/java) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#L99) |
| 4 | [C++](/src/cpp) | [✅](https://github.com/bazelbuild/rules_cc) | [✅](https://grpc.io/docs/languages/cpp) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#L86) |
| 7 | [JavaScript](/src/js) | [✅](https://github.com/bazelbuild/rules_nodejs) | [✅](https://grpc.io/docs/languages/node) | |
| 10 | [PHP](/src/php) | [not yet](https://github.com/greggdonovan/rules_php) | [✅](https://grpc.io/docs/languages/php) | |
| 11 | [Go](/src/go) | [✅](https://github.com/bazelbuild/rules_go) | [✅](https://grpc.io/docs/languages/go) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#LL113) |
| 16 | [Objective-C](/src/objc) | [✅](https://bazel.build/reference/be/objective-c) | [✅](https://grpc.io/docs/languages/objective-c/) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#L140) |
| 18 | [Swift](src/swift) | [✅](https://github.com/bazelbuild/rules_swift) | [✅](https://github.com/grpc/grpc-swift) | |
| 19 | [Ruby](/src/ruby) | [✅](https://github.com/bazelruby/rules_ruby) | [✅](https://grpc.io/docs/languages/ruby) | |
| 20 | [Rust](/src/rust) | [✅](https://github.com/bazelbuild/rules_rust) | [✅](https://blog.logrocket.com/rust-and-grpc-a-complete-guide/) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#L193) |
| 23 | [Perl](/src/perl) | [✅](https://github.com/bazelbuild/rules_perl) | [binding](https://github.com/joyrex2001/grpc-perl) | |
| 28 | [Kotlin](/src/kotlin) | [✅](https://github.com/bazelbuild/rules_kotlin) | [✅](https://grpc.io/docs/languages/kotlin) | |
| 34 | Scala | [✅](https://github.com/bazelbuild/rules_scala) | [✅](https://scalapb.github.io/docs/grpc) | |
| 35 | Dart | [maybe](https://github.com/cbracken/rules_dart) | [✅](https://grpc.io/docs/languages/dart) | |
| 36 | D | [✅](https://github.com/bazelbuild/rules_d) | [✅](https://github.com/hatf0/grpc-demo) | |
| 40 | [TypeScript](/src/ts) | [✅](https://bazelbuild.github.io/rules_nodejs/TypeScript.html) | [✅](https://grpc.io/blog/grpc-js-1.0/) | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#L159) |
| 40 | [Bash](/src/bash) | [✅](https://bazel.build/reference/be/shell) | [grpcurl](https://github.com/fullstorydev/grpcurl) | |
| 50 | [Haskell](/src/haskell) | [✅](https://github.com/tweag/rules_haskell) | [✅](https://github.com/awakesecurity/gRPC-haskell) | |
| >50 | Clojure | [✅](https://github.com/bazelbuild/rules_closure) | [✅](https://protojure.readthedocs.io/en/latest/grpc/) | |
| >50 | Crystal | | [✅](https://github.com/jgaskins/grpc) | |
| >50 | Elixir | 🟧 [partial](https://github.com/rabbitmq/rabbitmq-server/blob/d35ccd60c75683813316a96517052608f5215c2b/bazel/elixir/elixir.bzl#L1) | [✅](https://github.com/elixir-grpc/grpc) | |
| >50 | Erlang | [✅](https://github.com/rabbitmq/rules_erlang) | [✅](https://github.com/Bluehouse-Technology/grpc) | |
| >50 | OCaml | [✅](https://www.tweag.io/blog/2021-07-01-obazl/) | [bridge](https://github.com/blandinw/ocaml-grpc-envoy/) | |
| ? | [Protobuf](/src/proto) | [✅](https://github.com/bazelbuild/rules_proto) | NA | [✅](https://github.com/kythe/kythe/blob/3f41a10b5449bf763574f38f39f0a89e5ad13a86/kythe/extractors/BUILD#LL179) |
| ? | Zig | [✅](https://sr.ht/~motiejus/bazel-zig-cc) | 🟧 [zig-protobuf](https://github.com/Arwalk/zig-protobuf) | |

[TIOBE language index]: https://www.tiobe.com/tiobe-index
[bazel]: https://bazel.build
[grpc]: https://grpc.io
[kythe]: https://kythe.io
