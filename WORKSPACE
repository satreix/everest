workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_gazelle",
    sha256 = "ecba0f04f96b4960a5b250c8e8eeec42281035970aa8852dda73098274d14a1d",
    url = "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.29.0/bazel-gazelle-v0.29.0.tar.gz",
)

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "94070eff79305be05b7699207fbac5d2608054dd53e6109f7d00d923919ff45a",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/5.8.2/rules_nodejs-5.8.2.tar.gz",
)

http_archive(
    name = "bazelruby_rules_ruby",
    patch_args = ["-p1"],
    patches = [
        # A fix for https://github.com/bazelruby/rules_ruby/issues/79
        "//third_party:bazelruby_rules_ruby/0001-fix-rspec.patch",
    ],
    sha256 = "7c0da7ac6a89c980ad5fb9b815bb254bd06c153a774857bfc37bb4b90de769d8",
    strip_prefix = "rules_ruby-0a3275b235dd4093a2a44e2f08d96a9f07ecbe0a",
    url = "https://github.com/bazelruby/rules_ruby/archive/0a3275b235dd4093a2a44e2f08d96a9f07ecbe0a.tar.gz",
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "5e9f778132c4eedaf363c295b11d0f061d404b412953f9335f92be5c659dbfd8",
    strip_prefix = "grammars-v4-55f37012783152f7ac44eda95fec1d361edfd2ac",
    url = "https://github.com/antlr/grammars-v4/archive/55f37012783152f7ac44eda95fec1d361edfd2ac.tar.gz",
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "ca524d4df8c91838b9e80543832cf54d945e8045f6a2b9db1a1d02eec20e8b8c",
    strip_prefix = "buildtools-6.0.1",
    url = "https://github.com/bazelbuild/buildtools/archive/6.0.1.tar.gz",
)

http_archive(
    name = "com_github_gflags_gflags",
    sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
    strip_prefix = "gflags-2.2.2",
    url = "https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.tar.gz",
)

http_archive(
    name = "com_github_swagger_api_swagger_petstore",
    build_file_content = """exports_files(["src/main/resources/openapi.yaml"])""",
    sha256 = "ae350c7aff7b99465ad4f679613685a92a4350796ae9fcd8ef36952592fe5dfe",
    strip_prefix = "swagger-petstore-swagger-petstore-v3-1.0.11",
    url = "https://github.com/swagger-api/swagger-petstore/archive/refs/tags/swagger-petstore-v3-1.0.11.tar.gz",
)

http_archive(
    name = "com_github_tnarg_rules_cue",
    patch_args = ["-p1"],
    patches = [
        # Following bazel-gazelle https://github.com/bazelbuild/bazel-gazelle/commit/3e83644bd8b1ed373d322b898cf7c05927b39201#diff-c1403c382e16f440e9d5e59ebc70a6beb7f68f5ccefbcb5dd73e5cb9352e85a0
        "//third_party:com_github_tnarg_rules_cue/0001-fix-load-env_execute.patch",
    ],
    sha256 = "da3ddd504032d2776f9f1854bff9b1b9946d11dba243e96187f3b72604d69777",
    strip_prefix = "rules_cue-f85546145bab07a5cada175e74a736bee82ace68",
    url = "https://github.com/tnarg/rules_cue/archive/f85546145bab07a5cada175e74a736bee82ace68.zip",
)

http_archive(
    name = "com_google_google_java_format_source",
    sha256 = "0579aeff9f1127a9f18eb8167488de231c9a51279ec877ae8e047c56ac8b59b6",
    strip_prefix = "google-java-format-9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    url = "https://github.com/abergmeier-dsfishlabs/google-java-format/archive/9701afbdf2b29acb0660d6af1ea478842ffe40bc.tar.gz",
)

http_archive(
    name = "com_google_googletest",
    sha256 = "ad7fdba11ea011c1d925b3289cf4af2c66a352e18d4c7264392fead75e919363",
    strip_prefix = "googletest-1.13.0",
    url = "https://github.com/google/googletest/archive/refs/tags/v1.13.0.tar.gz",
)

http_archive(
    name = "contrib_rules_jvm",
    sha256 = "ced72bd69b5f5aa6905b07b8e38e1924de042c181607e1d8519bf5d9f90a897b",
    strip_prefix = "rules_jvm-0.11.0",
    url = "https://github.com/bazel-contrib/rules_jvm/archive/refs/tags/v0.11.0.tar.gz",
)

http_archive(
    name = "fmtlib",
    build_file = "//third_party:cc/fmtlib/BUILD.external",
    sha256 = "5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2",
    strip_prefix = "fmt-9.1.0",
    url = "https://github.com/fmtlib/fmt/archive/refs/tags/9.1.0.tar.gz",
)

http_archive(
    name = "fmeum_rules_jni",
    sha256 = "530a02c4d86f7bcfabd61e7de830f8c78fcb2ea70943eab8f2bfdad96620f1f5",
    strip_prefix = "rules_jni-0.7.0",
    url = "https://github.com/fmeum/rules_jni/archive/refs/tags/v0.7.0.tar.gz",
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    url = "https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "dd926a88a564a9246713a9c00b35315f54cbd46b31a26d5d8fb264c07045f05d",
    url = "https://github.com/bazelbuild/rules_go/releases/download/v0.38.1/rules_go-v0.38.1.zip",
)

http_archive(
    name = "io_bazel_rules_kotlin",
    sha256 = "fd92a98bd8a8f0e1cdcb490b93f5acef1f1727ed992571232d33de42395ca9b3",
    url = "https://github.com/bazelbuild/rules_kotlin/releases/download/v1.7.1/rules_kotlin_release.tgz",
)

http_archive(
    name = "io_grpc_grpc_java",
    patch_args = ["-p1"],
    patches = ["//third_party:io_grpc_grpc_java/0001-update-junit-to-v4.13.2.patch"],
    sha256 = "fd0a649d03a8da06746814f414fb4d36c1b2f34af2aad4e19ae43f7c4bd6f15e",
    strip_prefix = "grpc-java-1.53.0",
    url = "https://github.com/grpc/grpc-java/archive/v1.53.0.tar.gz",
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
    sha256 = "c6e4c253f1ae0fbe4d4ded8a719f6647273141d0dc3c0cd8bb074aa7fc3c8d1c",
    url = "https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/0.1.5/openapi-tools-generator-bazel-0.1.5.tar.gz",
)

# Used by rules_rust
http_archive(
    name = "platforms",
    sha256 = "5308fc1d8865406a49427ba24a9ab53087f17f5266a7aabbfc28823f3916e1ca",
    url = "https://github.com/bazelbuild/platforms/releases/download/0.0.6/platforms-0.0.6.tar.gz",
)

http_archive(
    name = "rules_antlr",
    patch_args = ["-p1"],
    patches = ["//third_party:rules_antlr/add_antlr_4.10.1.patch"],
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    url = "https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz",
)

http_archive(
    name = "rules_cc",
    sha256 = "3d9e271e2876ba42e114c9b9bc51454e379cbf0ec9ef9d40e2ae4cec61a31b40",
    strip_prefix = "rules_cc-0.0.6",
    url = "https://github.com/bazelbuild/rules_cc/archive/0.0.6.tar.gz",
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
    strip_prefix = "rules_foreign_cc-0.9.0",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.9.0.tar.gz",
)

http_archive(
    name = "rules_haskell",
    sha256 = "2a07b55c30e526c07138c717b0343a07649e27008a873f2508ffab3074f3d4f3",
    strip_prefix = "rules_haskell-0.16",
    url = "https://github.com/tweag/rules_haskell/archive/refs/tags/v0.16.tar.gz",
)

http_archive(
    name = "rules_java",
    sha256 = "9b87757af5c77e9db5f7c000579309afae75cf6517da745de01ba0c6e4870951",
    url = "https://github.com/bazelbuild/rules_java/releases/download/5.4.0/rules_java-5.4.0.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "1a5ebb66a52d490bd51e4fb12ce2746bdb9225d7b3188d64d4780c7cacf2decb",
    strip_prefix = "rules_jvm_external-5.1",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/5.1.tar.gz",
)

http_archive(
    name = "rules_perl",
    sha256 = "391edb08802860ba733d402c6376cfe1002b598b90d2240d9d302ecce2289a64",
    strip_prefix = "rules_perl-7f10dada09fcba1dc79a6a91da2facc25e72bd7d",
    url = "https://github.com/bazelbuild/rules_perl/archive/7f10dada09fcba1dc79a6a91da2facc25e72bd7d.tar.gz",
)

http_archive(
    name = "rules_proto",
    sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",
    strip_prefix = "rules_proto-4.0.0",
    url = "https://github.com/bazelbuild/rules_proto/archive/refs/tags/4.0.0.tar.gz",
)

http_archive(
    name = "rules_python",
    sha256 = "ffc7b877c95413c82bfd5482c017edcf759a6250d8b24e82f41f3c8b8d9e287e",
    strip_prefix = "rules_python-0.19.0",
    url = "https://github.com/bazelbuild/rules_python/archive/0.19.0.tar.gz",
)

http_archive(
    name = "rules_rust",
    sha256 = "2466e5b2514772e84f9009010797b9cd4b51c1e6445bbd5b5e24848d90e6fb2e",
    url = "https://github.com/bazelbuild/rules_rust/releases/download/0.18.0/rules_rust-v0.18.0.tar.gz",
)

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    url = "https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

# gazelle:repository go_repository name=io_bazel_rules_go importpath=github.com/bazelbuild/rules_go
# gazelle:repository_macro third_party/go/deps.bzl%go_dependencies
load("//third_party/go:deps.bzl", "go_dependencies")

go_dependencies()

go_rules_dependencies()

go_register_toolchains(
    # Update in lockstep with go.mod
    version = "1.19.5",
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# Note: this needs to be defore proto rules: https://github.com/bazelbuild/bazel-gazelle/issues/1366
gazelle_dependencies()

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

rules_java_dependencies()

rules_java_toolchains()

load("@contrib_rules_jvm//:repositories.bzl", "contrib_rules_jvm_deps")

contrib_rules_jvm_deps()

load("@contrib_rules_jvm//:setup.bzl", "contrib_rules_jvm_setup")

contrib_rules_jvm_setup()

load("@fmeum_rules_jni//jni:repositories.bzl", "rules_jni_dependencies")

rules_jni_dependencies()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python3_10_2",
    python_version = "3.10.2",
)

load("@python3_10_2//:defs.bzl", "interpreter")
load("//third_party/python:requirements.bzl", python_dependencies = "install_deps")

python_dependencies(
    python_interpreter_target = interpreter,
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

_RUST_VERSION = "1.62.1"

rust_register_toolchains(
    edition = "2021",
    versions = [_RUST_VERSION],
)

load("@rules_rust//proto:repositories.bzl", "rust_proto_repositories")

rust_proto_repositories()

load("@rules_rust//proto:transitive_repositories.bzl", "rust_proto_transitive_repositories")

rust_proto_transitive_repositories()

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
        "//src/rust/num:Cargo.toml",
        "//src/rust/web:Cargo.toml",
    ],
    rust_version = _RUST_VERSION,
)

load("@crate_index//:defs.bzl", "crate_repositories")

crate_repositories()

load("@io_grpc_grpc_java//:repositories.bzl", "grpc_java_repositories")

grpc_java_repositories()

load("//third_party/java:maven_install.bzl", "maven_install")

maven_install()

load("@maven//:compat.bzl", "compat_repositories")

compat_repositories()

load("@maven//:defs.bzl", "pinned_maven_install")

pinned_maven_install()

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

load("@com_google_google_java_format_source//tools/bazel:def.bzl", "java_format")

java_format(
    name = "com_google_google_java_format",
    diff = "@com_google_google_java_format_source//scripts:google-java-format-diff.py",
    jar_sha256 = "0894ee02019ee8b4acd6df09fb50bac472e7199e1a5f041f8da58d08730694aa",
    jar_url = "https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar",
)

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.10.1")

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
    bundler_version = "2.3.7",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
)

load("@com_github_tnarg_rules_cue//:go.bzl", cue_go_modules = "go_modules")
load("@com_github_tnarg_rules_cue//cue:deps.bzl", "cue_register_toolchains")

cue_go_modules()

cue_register_toolchains()

load("@build_bazel_rules_nodejs//:repositories.bzl", "build_bazel_rules_nodejs_dependencies")

build_bazel_rules_nodejs_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "nodejs_register_toolchains")

_NODE_REPO = "nodejs"

nodejs_register_toolchains(
    name = _NODE_REPO,
    node_version = "16.16.0",
)

load("@build_bazel_rules_nodejs//:index.bzl", "npm_install")

npm_install(
    name = "npm",
    node_repository = _NODE_REPO,
    package_json = "//:package.json",
    package_lock_json = "//:package-lock.json",
)

load("@rules_haskell//haskell:repositories.bzl", "rules_haskell_dependencies")

rules_haskell_dependencies()

load("@rules_haskell//haskell:toolchain.bzl", "rules_haskell_toolchains")

rules_haskell_toolchains(
    version = "8.10.7",
)

load("//third_party/haskell:stack_snapshot.bzl", "stack_snapshot")

stack_snapshot()

load("@rules_perl//perl:deps.bzl", "perl_register_toolchains", "perl_rules_dependencies")

perl_rules_dependencies()

perl_register_toolchains()

load("@io_bazel_rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")

kotlin_repositories()

load("@io_bazel_rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()
