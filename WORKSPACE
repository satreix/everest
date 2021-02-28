workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_antlr",
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    urls = ["https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz"],
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "a143a11d8209e6b82180bd0abfc6127999fca3c4c3834a93c6bf57a15ab0b3f3",
    strip_prefix = "grammars-v4-a7cffb20316f12e2f7b73c3e6ecae7715714758c",
    urls = ["https://github.com/antlr/grammars-v4/archive/a7cffb20316f12e2f7b73c3e6ecae7715714758c.tar.gz"],  # Latest @ 2021-02-15
)

http_archive(
    name = "rules_python",
    sha256 = "8cc0ad31c8fc699a49ad31628273529ef8929ded0a0859a3d841ce711a9a90d5",
    strip_prefix = "rules_python-c7e068d38e2fec1d899e1c150e372f205c220e27",
    urls = ["https://github.com/bazelbuild/rules_python/archive/c7e068d38e2fec1d899e1c150e372f205c220e27.tar.gz"],  # Latest @ 2021-02-15
)

http_archive(
    name = "jq",
    build_file = "//tools/jq:jq.BUILD.bazel",
    sha256 = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d",
    strip_prefix = "jq-1.4",
    url = "https://github.com/stedolan/jq/releases/download/jq-1.4/jq-1.4.tar.gz",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "7904dbecbaffd068651916dce77ff3437679f9d20e1a7956bff43826e7645fcc",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.25.1/rules_go-v0.25.1.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "222e49f034ca7a1d1231422cdb67066b885819885c356673cb1f72f748a3c9d4",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.3/bazel-gazelle-v0.22.3.tar.gz",
    ],
)

http_archive(
    name = "rules_rust",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/fee3b3c658c3d2f49c20c1b12e55063bf7a7f693.tar.gz"],  # Latest @ 2021-02-18
    strip_prefix = "rules_rust-fee3b3c658c3d2f49c20c1b12e55063bf7a7f693",
    sha256 = "0f55b4b69fd9bc1dbcc038e75ec54bd97fa00ddc6cfbc6278fc288dafc98b7f8",
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "d0f5f605d0d656007ce6c8b5a82df3037e1d8fe8b121ed42e536f569dec16113",
    strip_prefix = "protobuf-3.14.0",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.14.0.tar.gz",
    ],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "0d3ca4ed434958dda241fb129f77bd5ef0ce246250feed2d5a5470c6f29a77fa",
    strip_prefix = "buildtools-4.0.0",
    urls = ["https://github.com/bazelbuild/buildtools/archive/4.0.0.tar.gz"],
)

http_archive(
    name = "rules_cc",
    sha256 = "cb8ce8a25464b2a8536450971ad1b45ee309491c1f5e052a611b9e249cfdd35d",
    strip_prefix = "rules_cc-40548a2974f1aea06215272d9c2b47a14a24e556",
    urls = ["https://github.com/bazelbuild/rules_cc/archive/40548a2974f1aea06215272d9c2b47a14a24e556.tar.gz"],  # Latest @ 2021-02-15
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "31d226a6b3f5362b59d261abf9601116094ea4ae2aa9f28789b6c105e4cada68",
    strip_prefix = "rules_jvm_external-4.0",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.0.tar.gz"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "e7446144277c9578141821fc91c55a61df7ae01bda890902f7286f5fd2f6ae46",
    strip_prefix = "rules_foreign_cc-d54c78ab86b40770ee19f0949db9d74a831ab9f0",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/d54c78ab86b40770ee19f0949db9d74a831ab9f0.tar.gz"],  # 2020-11-10
)

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    urls = ["https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz"],
)

http_archive(
    name = "com_google_google_java_format_source",
    sha256 = "0579aeff9f1127a9f18eb8167488de231c9a51279ec877ae8e047c56ac8b59b6",
    strip_prefix = "google-java-format-9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    urls = ["https://github.com/abergmeier-dsfishlabs/google-java-format/archive/9701afbdf2b29acb0660d6af1ea478842ffe40bc.tar.gz"],
)

http_archive(
    name = "io_grpc_grpc_java",
    sha256 = "537d01bdc5ae2bdb267853a75578d671db3075b33e3a00a93f5a572191d3a7b3",
    strip_prefix = "grpc-java-1.35.0",
    urls = ["https://github.com/grpc/grpc-java/archive/v1.35.0.tar.gz"],
)

# Import examples in its own repo as its ignored in the main repository.
# Patch to hack visibility.
http_archive(
    name = "io_grpc_grpc_java_examples",
    patch_args = ["-p1"],
    patches = ["@everest//third_party:io_grpc_grpc_java_examples.patch"],
    sha256 = "537d01bdc5ae2bdb267853a75578d671db3075b33e3a00a93f5a572191d3a7b3",
    strip_prefix = "grpc-java-1.35.0/examples",
    urls = ["https://github.com/grpc/grpc-java/archive/v1.35.0.tar.gz"],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pypi",
    requirements = "//tools/python:requirements.txt",
)

load("@rules_rust//rust:repositories.bzl", "rust_repositories")

rust_repositories()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@io_grpc_grpc_java//:repositories.bzl", "IO_GRPC_GRPC_JAVA_ARTIFACTS", "IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS")

# View installed things:
# bazel query @maven//:all --output=build
maven_install(
    artifacts = [
        "com.google.googlejavaformat:google-java-format:1.7",
        "commons-cli:commons-cli:1.4",
    ] + IO_GRPC_GRPC_JAVA_ARTIFACTS,
    generate_compat_repositories = True,
    maven_install_json = "@everest//:maven_install.json",
    override_targets = IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS,
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

load("@maven//:compat.bzl", "compat_repositories")

compat_repositories()

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()

load("//third_party/cargo:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

load("@com_google_google_java_format_source//tools/bazel:def.bzl", "java_format")

java_format(
    name = "com_google_google_java_format",
    diff = "@com_google_google_java_format_source//scripts:google-java-format-diff.py",
    jar_sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa",
    jar_url = "https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar",
)

# gazelle:repository go_repository name=io_bazel_rules_go importpath=github.com/bazelbuild/rules_go
# gazelle:repository_macro deps.bzl%dependencies
load("//:deps.bzl", "dependencies")

dependencies()

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.8")

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")

grpc_java_repositories()
