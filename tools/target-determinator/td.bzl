load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

_DEFAULT_VERSIONS = "0.11.0"

_DRIVER_VERSIONS = {
    "0.11.0": {
        "darwin_arm64": ("driver.darwin.arm64", "2a5bafec41743b5c8027fed50d3abec265db3dd2bf8dfe869468817b8e2428ca"),
        "darwin_x86_64": ("driver.darwin.amd64", "e110ac4eb5f924ba1dd31d15c3d446f80ce070727ce017c3da8fea45ad5ec7a1"),
        "linux_aarch64": ("driver.linux.arm64", "47661cfeaf362bd5cc9af226b860f9d3e73fc04ef89d22079aacafa8452237ff"),
        "linux_x86_64": ("driver.linux.amd64", "09ea44981f865d6f3f09edd22d828f366919fb8ed2b0696bc301e348b2ecde34"),
    },
}

_TARGET_DETERMINATOR_VERSIONS = {
    "0.11.0": {
        "darwin_arm64": ("target-determinator.darwin.arm64", "5e2af30745335c65f0601fae28984803260b865c2334d3aaf08ad4e3ad8f6b70"),
        "darwin_x86_64": ("target-determinator.darwin.amd64", "a24009c5c705aea13d12eb43d8732e93d00b83dceeb0b35c8dd59b23d5ebfa8a"),
        "linux_aarch64": ("target-determinator.linux.arm64", "0f218c890405db83250521842dad329c323dae757c9bed0048bfd7c2c12055c6"),
        "linux_x86_64": ("target-determinator.linux.amd64", "86cfc6aff3050131f42d51f8ea3bdabbc146ea31a62f2bc6a553136ada8ea7f3"),
    },
}

def driver_deps(version = _DEFAULT_VERSIONS):
    for k, v in _DRIVER_VERSIONS[version].items():
        maybe(
            http_file,
            name = "target_determinator_driver_" + k,
            url = "https://github.com/bazel-contrib/target-determinator/releases/download/v{}/{}".format(version, v[0]),
            sha256 = v[1],
            executable = True,
        )

def target_determinator_deps(version = _DEFAULT_VERSIONS):
    for k, v in _TARGET_DETERMINATOR_VERSIONS[version].items():
        maybe(
            http_file,
            name = "target_determinator_" + k,
            url = "https://github.com/bazel-contrib/target-determinator/releases/download/v{}/{}".format(version, v[0]),
            sha256 = v[1],
            executable = True,
        )
