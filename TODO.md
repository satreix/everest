# TODO

Trying to PoC things with [Kythe](https://kythe.io).

So far what we got to:

## Setup

- setup in WORKSPACE with a patch for things that do not work
- add a patch for things that do not work yet
  - the go_register_toolchain
  - the typescript proto logic
- bind vnames
  - we should probably setup our own config at some point

## Extraction

[Extraction step](https://kythe.io/examples/#extracting-compilations-using-bazel).
We are starting small with only the protobuf extractor.

```console
$ bazel build @io_kythe//kythe/extractors:extract_kzip_protobuf
$ bazel build -k --experimental_action_listener=@io_kythe//kythe/extractors:extract_kzip_protobuf src/proto/helloworld
# Find the extracted .kzip files
$ find -L bazel-out -name '*.kzip'
```

## Indexing

[Indexing step](https://kythe.io/examples/#indexing-compilations).

```console
$ bazel build @io_kythe//kythe/cxx/indexer/proto:indexer
ERROR: WORKSPACE:212:25: no such target '@com_github_protocolbuffers_protobuf//:third_party/zlib.BUILD': target 'third_party/zlib.BUILD' not declared in package ''; however, a source file of this name exists.  (Perhaps add 'exports_files(["third_party/zlib.BUILD"])' to /BUILD?) defined by external/com_github_protocolbuffers_protobuf/BUILD and referenced by '//external:zlib'
INFO: Repository org_libzip instantiated at:
  WORKSPACE:412:19: in <toplevel>
  external/io_kythe/external.bzl:1188:21: in kythe_dependencies
  external/io_kythe/external.bzl:104:10: in _cc_dependencies
  external/bazel_tools/tools/build_defs/repo/utils.bzl:233:18: in maybe
Repository rule http_archive defined at:
  external/bazel_tools/tools/build_defs/repo/http.bzl:355:31: in <toplevel>
ERROR: Analysis of target '@io_kythe//kythe/cxx/indexer/proto:indexer' failed; build aborted:
FAILED: Build did NOT complete successfully (28 packages loaded, 911 targets configured)
    Fetching @boringssl; Cloning 3ef9a6b03503ae25f9267473073fea9c39d9cdac of https://github.com/google/boringssl
```

This is where we are for now, I probably need to fix the way we setup protobuf, or its version.
