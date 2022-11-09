load("@rules_haskell//haskell:cabal.bzl", _stack_snapshot = "stack_snapshot")

def stack_snapshot():
    _stack_snapshot(
        name = "stackage",
        packages = [
            "optparse-applicative",
        ],
        snapshot = "lts-18.18",
        stack_snapshot_json = "//third_party/haskell:stackage_snapshot.json",
    )
