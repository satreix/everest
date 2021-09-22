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
    sha256 = "966714e4ad619b824a2f077e249c9fac65075bdac707b95ceef58c5159553de0",
    strip_prefix = "grammars-v4-95a3ba0b46e99a1c37ddecba7c9b3d42b79b4a1b",
    urls = ["https://github.com/antlr/grammars-v4/archive/95a3ba0b46e99a1c37ddecba7c9b3d42b79b4a1b.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "9df3a651b2f7aed4516cbe1de0d70ed57d1c1d48cd50308b64defe7192a751ab",
    strip_prefix = "rules_python-c303849892a2c716a2582172be43ba525feac23d",
    urls = ["https://github.com/bazelbuild/rules_python/archive/c303849892a2c716a2582172be43ba525feac23d.tar.gz"],
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
    sha256 = "82b30cbb46c61a9014de0a8d0443a45e6eb6bd9add35ab421cfb1943dc3271f5",
    strip_prefix = "rules_rust-e589105b4e8181dd1d0d8ccaa0cf3267efb06e86",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/e589105b4e8181dd1d0d8ccaa0cf3267efb06e86.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "c6003e1d2e7fefa78a3039f19f383b4f3a61e81be8c19356f85b6461998ad3db",
    strip_prefix = "protobuf-3.17.3",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/protocolbuffers/protobuf/archive/v3.17.3.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.17.3.tar.gz",
    ],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "c28eef4d30ba1a195c6837acf6c75a4034981f5b4002dda3c5aa6e48ce023cf1",
    strip_prefix = "buildtools-4.0.1",
    urls = ["https://github.com/bazelbuild/buildtools/archive/4.0.1.tar.gz"],
)

http_archive(
    name = "rules_cc",
    sha256 = "67571de4070cff615f7232281d8b12d8400976d21c19d8274386ab02799269fb",
    strip_prefix = "rules_cc-dd2758b96dc8f9f4add81eaa4154b7e3d8be6873",
    urls = ["https://github.com/bazelbuild/rules_cc/archive/dd2758b96dc8f9f4add81eaa4154b7e3d8be6873.tar.gz"],
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "31d226a6b3f5362b59d261abf9601116094ea4ae2aa9f28789b6c105e4cada68",
    strip_prefix = "rules_jvm_external-4.0",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.0.tar.gz"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "c86fc7df961b10fa61c551721d7d524f029af03638947f204afa855f14c0eb41",
    strip_prefix = "rules_foreign_cc-18b491b61d1b31aa0461b9a457bb912567f3ab8c",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/18b491b61d1b31aa0461b9a457bb912567f3ab8c.tar.gz"],
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

GRPC_JAVA_VERSION = "1.36.0"

GRPC_JAVA_SHA256 = "ab28b5b5729aff73d3907eaf5c79fa46fb82db09754c279f6833f93c03afec65"

http_archive(
    name = "io_grpc_grpc_java",
    sha256 = GRPC_JAVA_SHA256,
    strip_prefix = "grpc-java-%s" % GRPC_JAVA_VERSION,
    urls = ["https://github.com/grpc/grpc-java/archive/v%s.tar.gz" % GRPC_JAVA_VERSION],
)

# Import examples in its own repo as its ignored in the main repository.
# Patch to hack visibility.
http_archive(
    name = "io_grpc_grpc_java_examples",
    patch_args = ["-p1"],
    patches = ["@everest//third_party:io_grpc_grpc_java_examples.patch"],
    sha256 = GRPC_JAVA_SHA256,
    strip_prefix = "grpc-java-%s/examples" % GRPC_JAVA_VERSION,
    urls = ["https://github.com/grpc/grpc-java/archive/v%s.tar.gz" % GRPC_JAVA_VERSION],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@rules_python//python:pip.bzl", "pip_install")

pip_install(
    name = "pypi",
    requirements = "//third_party/python:requirements.txt",
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

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

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
