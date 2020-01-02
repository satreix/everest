# Everest

Bazel playground.

## Format code

```console
$ ./tools/format.sh
```

## Update dependencies

There is a couple of per-language to Bazel binding.
When you change the dependencies in Pipenv, Cargo, go mod or other, run the
following command to sync those bindings:

```console
$ ./tools/update-deps.sh
```
