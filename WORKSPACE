workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazelruby_rules_ruby",
    patch_args = ["-p1"],
    patches = [
        # A fix for https://github.com/bazelruby/rules_ruby/issues/79
        "//third_party:bazelruby_rules_ruby/0001-fix-rspec.patch",
    ],
    sha256 = "33217f27c7cc44355dc82bbe172d0ace09c6a73da387bbbcd66cff013d35e498",
    strip_prefix = "rules_ruby-8a03f6c54f1bb3ecbbb82c8e2fdbf40e049a8115",
    url = "https://github.com/bazelruby/rules_ruby/archive/8a03f6c54f1bb3ecbbb82c8e2fdbf40e049a8115.tar.gz",
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "d0c6a42283b4a7a263d3f350f88e21ab53be601456901d4286623f71bce775db",
    strip_prefix = "grammars-v4-153d66809d26425e5ac49cec77294f034d99eb0b",
    url = "https://github.com/antlr/grammars-v4/archive/153d66809d26425e5ac49cec77294f034d99eb0b.tar.gz",
)

http_archive(
    name = "com_github_swagger_api_swagger_petstore",
    build_file_content = """exports_files(["src/main/resources/openapi.yaml"])""",
    sha256 = "ae350c7aff7b99465ad4f679613685a92a4350796ae9fcd8ef36952592fe5dfe",
    strip_prefix = "swagger-petstore-swagger-petstore-v3-1.0.11",
    url = "https://github.com/swagger-api/swagger-petstore/archive/refs/tags/swagger-petstore-v3-1.0.11.tar.gz",
)

http_archive(
    name = "com_google_google_java_format_source",
    sha256 = "0579aeff9f1127a9f18eb8167488de231c9a51279ec877ae8e047c56ac8b59b6",
    strip_prefix = "google-java-format-9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    url = "https://github.com/abergmeier-dsfishlabs/google-java-format/archive/9701afbdf2b29acb0660d6af1ea478842ffe40bc.tar.gz",
)

http_archive(
    name = "contrib_rules_jvm",
    sha256 = "a06555618ed249fdfd8b138505de9f012a98eae4672ef00aa3cfc5f154ade6c7",
    strip_prefix = "rules_jvm-0.26.0",
    url = "https://github.com/bazel-contrib/rules_jvm/archive/refs/tags/v0.26.0.tar.gz",
)

http_archive(
    name = "jq",
    build_file = "//tools/jq:jq.BUILD.bazel",
    sha256 = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d",
    strip_prefix = "jq-1.4",
    url = "https://github.com/stedolan/jq/releases/download/jq-1.4/jq-1.4.tar.gz",
)

http_archive(
    name = "openapi_tools_generator_bazel",
    sha256 = "ada94694b10f2503c52a48427bd8589323bff5910bd1a7e5212ce34702d0af65",
    url = "https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/v0.1.6/openapi-tools-generator-bazel-0.1.6.tar.gz",
)

http_archive(
    name = "rules_antlr",
    patch_args = ["-p1"],
    patches = ["//third_party:rules_antlr/add_antlr_4.13.0.patch"],
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    url = "https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz",
)

http_archive(
    name = "rules_rust",
    sha256 = "24b378ed97006f1f7012be498a26f81ddb9901318b88380aee8522fdfbe8b735",
    url = "https://github.com/bazelbuild/rules_rust/releases/download/0.42.1/rules_rust-v0.42.1.tar.gz",
)

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    url = "https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz",
)

load("@contrib_rules_jvm//:repositories.bzl", "contrib_rules_jvm_deps")

contrib_rules_jvm_deps()

load("@contrib_rules_jvm//:setup.bzl", "contrib_rules_jvm_setup")

contrib_rules_jvm_setup()

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

_RUST_VERSION = "1.75.0"

rust_register_toolchains(
    edition = "2021",
    versions = [_RUST_VERSION],
)

load("@rules_rust//proto/protobuf:repositories.bzl", "rust_proto_protobuf_dependencies", "rust_proto_protobuf_register_toolchains")

rust_proto_protobuf_dependencies()

rust_proto_protobuf_register_toolchains()

load("@rules_rust//proto/protobuf:transitive_repositories.bzl", "rust_proto_protobuf_transitive_repositories")

rust_proto_protobuf_transitive_repositories()

load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")

crate_universe_dependencies()

load("@rules_rust//crate_universe:defs.bzl", "crates_repository")

crates_repository(
    name = "crate_index",
    cargo_lockfile = "//:Cargo.lock",
    lockfile = "//third_party/rust:lockfile.json",
    manifests = [
        "//:Cargo.toml",
        "//src/rust/grpc_server:Cargo.toml",
        "//src/rust/hello_world:Cargo.toml",
        "//src/rust/luhn:Cargo.toml",
        "//src/rust/num:Cargo.toml",
        "//src/rust/web:Cargo.toml",
    ],
    rust_version = _RUST_VERSION,
)

load("@crate_index//:defs.bzl", "crate_repositories")

crate_repositories()

load("@com_google_google_java_format_source//tools/bazel:def.bzl", "java_format")

java_format(
    name = "com_google_google_java_format",
    diff = "@com_google_google_java_format_source//scripts:google-java-format-diff.py",
    jar_sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa",
    jar_url = "https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar",
)

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.13.0")

load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

openapi_tools_generator_bazel_repositories(
    openapi_generator_cli_version = "5.4.0",
    sha256 = "f3ed312310e390324b33ba2ffff290ce812935207a1493ec5c098d0a441be51c",
)

load("@bazelruby_rules_ruby//ruby:deps.bzl", "rules_ruby_dependencies", "rules_ruby_select_sdk")

rules_ruby_dependencies()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

rules_ruby_select_sdk()

load("@bazelruby_rules_ruby//ruby:defs.bzl", "ruby_bundle")

ruby_bundle(
    name = "bundle",
    bundler_version = "2.5.3",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
)
