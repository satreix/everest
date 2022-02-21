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
    sha256 = "ac238933bf0434ac6674e6c2ad6de71fa9d2173d053ff399d5c362d8a9dd635a",
    strip_prefix = "grammars-v4-d77f1dc96545c32233013d850f82b7651fcf75d2",
    urls = ["https://github.com/antlr/grammars-v4/archive/d77f1dc96545c32233013d850f82b7651fcf75d2.tar.gz"],
)

http_archive(
    name = "jq",
    build_file = "//tools/jq:jq.BUILD.bazel",
    sha256 = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d",
    strip_prefix = "jq-1.4",
    urls = ["https://github.com/stedolan/jq/releases/download/jq-1.4/jq-1.4.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d6b2513456fe2229811da7eb67a444be7785f5323c6708b38d851d2b51e54d83",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/v0.30.0/rules_go-v0.30.0.zip"],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz"],
)

http_archive(
    name = "rules_rust",
    sha256 = "826ef092c93cf19ad5f3eeda14fbe66b92f33a4d0ac48ec5f8e3a1476723bbf0",
    strip_prefix = "rules_rust-14f48e7aa20094930b80bef5a0fdf26409d7461e",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/14f48e7aa20094930b80bef5a0fdf26409d7461e.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "14e8042b5da37652c92ef6a2759e7d2979d295f60afd7767825e3de68c856c54",
    strip_prefix = "protobuf-3.18.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.18.0.tar.gz"],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "44a6e5acc007e197d45ac3326e7f993f0160af9a58e8777ca7701e00501c0857",
    strip_prefix = "buildtools-4.2.4",
    urls = ["https://github.com/bazelbuild/buildtools/archive/4.2.4.tar.gz"],
)

http_archive(
    name = "rules_cc",
    sha256 = "935e2644125fccb36fa858495697301f7834d980d0e16419943b9618af2771a4",
    strip_prefix = "rules_cc-0.0.1",
    url = "https://github.com/bazelbuild/rules_cc/archive/0.0.1.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "31d226a6b3f5362b59d261abf9601116094ea4ae2aa9f28789b6c105e4cada68",
    strip_prefix = "rules_jvm_external-4.0",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.0.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "a30abdfc7126d497a7698c29c46ea9901c6392d6ed315171a6df5ce433aa4502",
    strip_prefix = "rules_python-0.6.0",
    urls = ["https://github.com/bazelbuild/rules_python/archive/0.6.0.tar.gz"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "1df78c7d7eed2dc21b8b325a2853c31933a81e7b780f9a59a5d078be9008b13a",
    strip_prefix = "rules_foreign_cc-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.0.tar.gz"],
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

http_archive(
    name = "cargo_raze",
    sha256 = "58ecdbae2680b71edc19a0f563cdb73e66c8914689b6edab258c8b90a93b13c7",
    strip_prefix = "cargo-raze-0.15.0",
    url = "https://github.com/google/cargo-raze/archive/v0.15.0.tar.gz",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.16")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pypi",
    requirements_lock = "//third_party/python:requirements_lock.txt",
)

load("@pypi//:requirements.bzl", install_python_deps = "install_deps")

install_python_deps()

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains()

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
    maven_install_json = "@everest//third_party/java:maven_install.json",
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
# gazelle:repository_macro third_party/go/deps.bzl%go_dependencies
load("//third_party/go:deps.bzl", "go_dependencies")

go_dependencies()

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.8")

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")

grpc_java_repositories()

load("@cargo_raze//:repositories.bzl", "cargo_raze_repositories")

cargo_raze_repositories()

load("@cargo_raze//:transitive_deps.bzl", "cargo_raze_transitive_deps")

cargo_raze_transitive_deps()
