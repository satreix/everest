workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    sha256 = "e5d90f0ec952883d56747b7604e2a15ee36e288bb556c3d0ed33e818a4d971f2",
    strip_prefix = "bazel-skylib-1.0.2",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/1.0.2.tar.gz",
)

git_repository(
    name = "rules_python",
    commit = "94677401bc56ed5d756f50b441a6a5c7f735a6d4",
    remote = "https://github.com/bazelbuild/rules_python.git",
    shallow_since = "1573842889 -0500",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

load("@rules_python//python:pip.bzl", "pip_repositories")

pip_repositories()

load("@rules_python//python:pip.bzl", "pip3_import")

pip3_import(
    name = "pypi",
    requirements = "//tools/python:requirements.txt",
)

load("@pypi//:requirements.bzl", "pip_install")

pip_install()

http_archive(
    name = "jq",
    build_file = "//tools/jq:jq.BUILD.bazel",
    sha256 = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d",
    strip_prefix = "jq-1.4",
    url = "https://github.com/stedolan/jq/releases/download/jq-1.4/jq-1.4.tar.gz",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "b9aa86ec08a292b97ec4591cf578e020b35f98e12173bbd4a921f84f583aebd9",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.20.2/rules_go-v0.20.2.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.20.2/rules_go-v0.20.2.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "86c6d481b3f7aedc1d60c1c211c6f76da282ae197c3b3160f54bd3a8f847896f",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.19.1/bazel-gazelle-v0.19.1.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.19.1/bazel-gazelle-v0.19.1.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

http_archive(
    name = "io_bazel_rules_rust",
    sha256 = "b6da34e057a31b8a85e343c732de4af92a762f804fc36b0baa6c001423a70ebc",
    strip_prefix = "rules_rust-55f77017a7f5b08e525ebeab6e11d8896a4499d2",
    urls = [
        # Master branch as of 2019-10-07
        "https://github.com/bazelbuild/rules_rust/archive/55f77017a7f5b08e525ebeab6e11d8896a4499d2.tar.gz",
    ],
)

load("@io_bazel_rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@io_bazel_rules_rust//:workspace.bzl", "bazel_version")

bazel_version(name = "bazel_version")

http_archive(
    name = "com_google_protobuf",
    sha256 = "758249b537abba2f21ebc2d02555bf080917f0f2f88f4cbe2903e0e28c4187ed",
    strip_prefix = "protobuf-3.10.0",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/protocolbuffers/protobuf/archive/v3.10.0.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.10.0.tar.gz",
    ],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "f3ef44916e6be705ae862c0520bac6834dd2ff1d4ac7e5abc61fe9f12ce7a865",
    strip_prefix = "buildtools-0.29.0",
    urls = ["https://github.com/bazelbuild/buildtools/archive/0.29.0.tar.gz"],
)

git_repository(
    name = "rules_cc",
    commit = "1f87a00b388c29337553581ec94a17985f121031",
    remote = "https://github.com/bazelbuild/rules_cc.git",
    shallow_since = "1574844018 -0800",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "1bbf2e48d07686707dd85357e9a94da775e1dbd7c464272b3664283c9c716d26",
    strip_prefix = "rules_jvm_external-2.10",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/2.10.zip",
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

# View installed things:
# bazel query @maven//:all --output=build
maven_install(
    artifacts = [
        "com.google.code.gson:gson:2.8.5",
        "com.google.googlejavaformat:google-java-format:1.7",
        "commons-cli:commons-cli:1.4",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

load("//examples/rust/hello_world:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()

http_archive(
    name = "rules_foreign_cc",
    sha256 = "e7446144277c9578141821fc91c55a61df7ae01bda890902f7286f5fd2f6ae46",
    strip_prefix = "rules_foreign_cc-d54c78ab86b40770ee19f0949db9d74a831ab9f0",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/d54c78ab86b40770ee19f0949db9d74a831ab9f0.tar.gz"],  # 2020-11-10
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    urls = ["https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz"],
)

git_repository(
    name = "com_google_google_java_format_source",
    commit = "9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    remote = "https://github.com/abergmeier-dsfishlabs/google-java-format.git",
    shallow_since = "1508756910 +0200",
)

load("@com_google_google_java_format_source//tools/bazel:def.bzl", "java_format")

java_format(
    name = "com_google_google_java_format",
    diff = "@com_google_google_java_format_source//scripts:google-java-format-diff.py",
    jar_sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa",
    jar_url = "https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar",
)

# gazelle:repository_macro deps.bzl%dependencies

load("//:deps.bzl", "dependencies")

dependencies()
