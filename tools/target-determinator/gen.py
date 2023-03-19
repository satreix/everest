#!/usr/bin/env python3

import json
import subprocess

#name = "driver"
name = "target-determinator"

mapping = {
    f"{name}.darwin.amd64": "@bazel_tools//src/conditions:darwin_x86_64",
    f"{name}.darwin.arm64": "@bazel_tools//src/conditions:darwin_arm64",
    f"{name}.linux.amd64": "@bazel_tools//src/conditions:linux_x86_64",
    f"{name}.linux.arm64": "@bazel_tools//src/conditions:linux_aarch64",
}

subprocess.run([
    "bazel",
    "run",
    "src/python/gh-release-to-bzl",
    "--",
    "bazel-contrib/target-determinator",
    "v0.11.0",
    json.dumps(mapping),
])
