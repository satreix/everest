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
    sha256 = "4a498adee6efc6133da81755d681486fb2c057c9fd43ff15051d1de9b44fc24a",
    strip_prefix = "grammars-v4-c7a622abf9fabfd83a66d4a74043a8b0cbabced9",
    urls = ["https://github.com/antlr/grammars-v4/archive/c7a622abf9fabfd83a66d4a74043a8b0cbabced9.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "f08874e5ad377e10883b4ab96a3950ea9826e4e26793aa04a3500f1f1eded963",
    strip_prefix = "rules_python-e48694612ebaa83fedc4d22105eb7a49587574f0",
    urls = ["https://github.com/bazelbuild/rules_python/archive/e48694612ebaa83fedc4d22105eb7a49587574f0.tar.gz"],
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
    sha256 = "e09656770684ae5f67951c05ad1a2b5561ca220d0bf1bad228712a71af02ce79",
    strip_prefix = "rules_rust-2de6496df08b94e65a38a0fcafae9fff712862e2",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/2de6496df08b94e65a38a0fcafae9fff712862e2.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "bc3dbf1f09dba1b2eb3f2f70352ee97b9049066c9040ce0c9b67fb3294e91e4b",
    strip_prefix = "protobuf-3.15.5",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/protocolbuffers/protobuf/archive/v3.15.5.tar.gz",
        "https://github.com/protocolbuffers/protobuf/archive/v3.15.5.tar.gz",
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
    sha256 = "8649734c48b914b64a3e8716849a92161ffc15057097abdc1fd278dbad53dabf",
    strip_prefix = "rules_cc-88ef31b429631b787ceb5e4556d773b20ad797c8",
    urls = ["https://github.com/bazelbuild/rules_cc/archive/88ef31b429631b787ceb5e4556d773b20ad797c8.tar.gz"],
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "31d226a6b3f5362b59d261abf9601116094ea4ae2aa9f28789b6c105e4cada68",
    strip_prefix = "rules_jvm_external-4.0",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.0.tar.gz"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "55ab92660def486f3ca9fc0a8150a86f46cfc742730d4ab5a6d486c288b42102",
    strip_prefix = "rules_foreign_cc-175b29c6f78cf3c78516836587c268f3d0690526",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/175b29c6f78cf3c78516836587c268f3d0690526.tar.gz"],
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
