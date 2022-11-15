#!/usr/bin/env python3
import argparse
import hashlib
import json
import logging
from dataclasses import dataclass

import requests
from github import Github
from jinja2 import BaseLoader, Environment

TPL = """load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

_DEFAULT_VERSIONS = "{{ version }}"

_VERSIONS = {
    "{{ version }}": {
        {%- for suffix, v in variants.items() %}
        "{{ suffix }}": ("{{ v.name }}", "{{ v.sha256 }}"),
        {%- endfor %}
    },
}

def target_determinator_deps(version=_DEFAULT_VERSIONS):
    for k, v in _VERSIONS[version].items():
        maybe(
            http_file,
            name = "target_determinator_" + k,
            url = "https://github.com/bazel-contrib/target-determinator/releases/download/v{}/{}".format(version, v[0]),
            sha256 = v[1],
        )

# Move this to the BUILD.bazel file
alias(
    name = "target-determinator",
    actual = select({
        {%- for suffix, v in variants.items() %}
        "{{ v.constraint }}": "@target_determinator_{{ suffix }}//file",
        {%- endfor %}
    })
)
"""


@dataclass
class Variant:
    name: str
    sha256: str
    constraint: str


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("repo")
    parser.add_argument("tag")
    parser.add_argument("mapping")
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    # FIXME parse a Github URL directly.
    repo = args.repo
    tag = args.tag
    mapping = json.loads(args.mapping)

    version = tag.removeprefix("v")
    variants = {}

    gh = Github()
    for asset in gh.get_repo(repo).get_release(tag).get_assets():
        if asset.name not in mapping.keys():
            continue
        constraint = mapping[asset.name]
        resp = requests.get(asset.browser_download_url)
        h = hashlib.sha256(resp.content).hexdigest()
        suffix = constraint.split(":")[1]
        variants[suffix] = Variant(asset.name, h, constraint)

    t = Environment(loader=BaseLoader).from_string(TPL)
    print(t.render(version=version, variants=variants))


if __name__ == "__main__":
    main()
