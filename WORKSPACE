workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_swagger_api_swagger_petstore",
    build_file_content = """exports_files(["src/main/resources/openapi.yaml"])""",
    sha256 = "ae350c7aff7b99465ad4f679613685a92a4350796ae9fcd8ef36952592fe5dfe",
    strip_prefix = "swagger-petstore-swagger-petstore-v3-1.0.11",
    urls = ["https://github.com/swagger-api/swagger-petstore/archive/refs/tags/swagger-petstore-v3-1.0.11.tar.gz"],
)

http_archive(
    name = "openapi_tools_generator_bazel",
    sha256 = "c6e4c253f1ae0fbe4d4ded8a719f6647273141d0dc3c0cd8bb074aa7fc3c8d1c",
    urls = ["https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/0.1.5/openapi-tools-generator-bazel-0.1.5.tar.gz"],
)

http_archive(
    name = "rules_antlr",
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    urls = ["https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz"],
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "b1a3e7a7a95a0ec46f945a84a0d7dd80ed9dae06c85136a1b8025bc7dbe6fa68",
    strip_prefix = "grammars-v4-682768f1e997af0887829c64f5fd07f70e834bcf",
    urls = ["https://github.com/antlr/grammars-v4/archive/682768f1e997af0887829c64f5fd07f70e834bcf.tar.gz"],
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
    sha256 = "c9478810c5e2ab1e19bb830b1d8284736b9a6395b96ce914c8ac5ce8d1368d0d",
    strip_prefix = "rules_rust-41b39f0c9951dfda3bd0a95df31695578dd3f5ea",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/41b39f0c9951dfda3bd0a95df31695578dd3f5ea.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "3bd7828aa5af4b13b99c191e8b1e884ebfa9ad371b0ce264605d347f135d2568",
    strip_prefix = "protobuf-3.19.4",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.19.4.tar.gz"],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "7f43df3cca7bb4ea443b4159edd7a204c8d771890a69a50a190dc9543760ca21",
    strip_prefix = "buildtools-5.0.1",
    urls = ["https://github.com/bazelbuild/buildtools/archive/5.0.1.tar.gz"],
)

http_archive(
    name = "rules_cc",
    sha256 = "935e2644125fccb36fa858495697301f7834d980d0e16419943b9618af2771a4",
    strip_prefix = "rules_cc-0.0.1",
    url = "https://github.com/bazelbuild/rules_cc/archive/0.0.1.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "2cd77de091e5376afaf9cc391c15f093ebd0105192373b334f0a855d89092ad5",
    strip_prefix = "rules_jvm_external-4.2",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.2.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "15f84594af9da06750ceb878abbf129241421e3abbd6e36893041188db67f2fb",
    strip_prefix = "rules_python-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_python/archive/0.7.0.tar.gz"],
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "bcd0c5f46a49b85b384906daae41d277b3dc0ff27c7c752cc51e43048a58ec83",
    strip_prefix = "rules_foreign_cc-0.7.1",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.1.tar.gz"],
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

GRPC_JAVA_VERSION = "1.44.1"

GRPC_JAVA_SHA256 = "0e72de67dd47d564b9cb8badb5267c6763dc25f8c02feb6fc69a05c6ae21b7bd"

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

go_register_toolchains(
    version = "1.17.6",
)

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

load("@rules_rust//util/import:deps.bzl", _rules_rust_util_import_deps = "import_deps")

_rules_rust_util_import_deps()

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
    fail_if_repin_required = True,
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

load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

openapi_tools_generator_bazel_repositories(
    openapi_generator_cli_version = "5.4.0",
    sha256 = "f3ed312310e390324b33ba2ffff290ce812935207a1493ec5c098d0a441be51c",
)
