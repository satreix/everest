# Everest

[Bazel][] playground.

## Building

```console
$ bazel build //...
```

## Testing

```console
$ bazel test //...
```

## Format code

```console
$ ./tools/format.sh
```

## Update dependencies

There is a couple of per-language to Bazel binding. When you change the
dependencies in uv, Cargo, go mod or other, run the following command to
sync those bindings:

```console
$ ./tools/sync-dependencies.sh
```

[bazel]: https://bazel.build
