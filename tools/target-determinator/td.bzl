load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# bazel run src/go/gh-release-to-bzl -- "bazel-contrib/target-determinator" v0.11.0

# https://github.com/bazel-contrib/target-determinator/releases/download/v0.11.0/driver.darwin.amd64
# e110ac4eb5f924ba1dd31d15c3d446f80ce070727ce017c3da8fea45ad5ec7a1

_DEFAULT_VERSIONS = "0.11.0"

_VERSIONS = {
    "0.11.0": {
        "darwin_x86_64": ("driver.darwin.amd64", "sha256-4RCsTrX5JLod0x0Vw9RG+AzgcHJ84BfD2o/qRa1ex6E= sha384-stsD+x+gXXod5OKe1GTTGYfJKyqzt+stCOnshwTvY+zkQtEZTRVyvbUskmCt1ycZ sha512-Cgvj7OGF/tCYoQt3N9awNLeOjiqxl1vtZiOUlaW6c5xlZXsR52A8YZ+zK8Vd3S9nYvaVzkY1oaKuqvcbAuCVfw=="),
        "linux_aarch64": ("driver.linux.arm64", "sha256-R2Yc/q82K9XMmvImuGD50+c/wE74nSIHmqyvqEUiN/8= sha384-ZI9/LWp48zjMJpzxecETWJRqEJQQu/4n/x8CyPazxK6f4Ojj76V4mEP23YV/3MTj sha512-rqbsfuf95gAHaIKTi05BnXMzLIpMq9WL5vwTQEJgWcZwm4W93IKkX6u4Z01sGuQ3y2S5Y1c0QRug8VUOCBwZVg=="),
    },
}

def driver_deps(version = _DEFAULT_VERSIONS):
    for k, v in _VERSIONS[version].items():
        maybe(
            http_file,
            name = "target_determinator_driver_" + k,
            url = "https://github.com/bazel-contrib/target-determinator/releases/download/v{}/{}".format(version, v[0]),
            # integrity = v[1],
        )
