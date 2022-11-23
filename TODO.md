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
We are starting small with only the go extractor.

```console
$ bazel build @io_kythe//kythe/extractors:extract_kzip_go
$ bazel build -k \
    --experimental_action_listener=@io_kythe//kythe/extractors:extract_kzip_go \
    --experimental_extra_action_top_level_only \
    src/go/hello_world
# Find the extracted .kzip files
$ find -L bazel-out -name '*.kzip'
```

## Indexing

[Indexing step](https://kythe.io/examples/#indexing-compilations).

```console
$ bazel build @io_kythe//kythe/go/indexer/cmd/go_indexer
$ bazel-bin/external/io_kythe/kythe/go/indexer/cmd/go_indexer/go_indexer (find -L bazel-out -name '*.kzip') > entries

$ bazel build @io_kythe//kythe/go/platform/tools/entrystream
$ bazel-bin/external/io_kythe/kythe/go/platform/tools/entrystream/entrystream --write_format=json < entries
... json stream

$ bazel build @io_kythe//kythe/go/storage/tools/write_entries
$ bazel-bin/external/io_kythe/kythe/go/storage/tools/write_entries/write_entries --graphstore leveldb:/tmp/gs < entries
write_entries: 2022/11/23 18:43:56 Wrote 581 entries

$ bazel run @io_kythe//kythe/go/storage/tools/triples -- --graphstore /tmp/gs | gzip >kythe.nq.gz
2022/11/23 18:45:40 Wrote 504 triples

# cayley http --dbpath kythe.nq.gz

```

This is where we are for now.