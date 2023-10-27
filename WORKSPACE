workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_gazelle",
    sha256 = "d3fa66a39028e97d76f9e2db8f1b0c11c099e8e01bf363a923074784e451f809",
    url = "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.33.0/bazel-gazelle-v0.33.0.tar.gz",
)

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "709cc0dcb51cf9028dd57c268066e5bc8f03a119ded410a13b5c3925d6e43c48",
    url = "https://github.com/bazelbuild/rules_nodejs/releases/download/5.8.4/rules_nodejs-5.8.4.tar.gz",
)

http_archive(
    name = "bazelruby_rules_ruby",
    patch_args = ["-p1"],
    patches = [
        # A fix for https://github.com/bazelruby/rules_ruby/issues/79
        "//third_party:bazelruby_rules_ruby/0001-fix-rspec.patch",
    ],
    sha256 = "e1886a644d68ad4936cc7ae0a31aab1b5028cb1f80a365a184b9a24a92bf355b",
    strip_prefix = "rules_ruby-e60d0cd0f2100287a93557334c48117839fe4762",
    url = "https://github.com/bazelruby/rules_ruby/archive/e60d0cd0f2100287a93557334c48117839fe4762.tar.gz",
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "6dd661dbfcc8e0724c44d21acee842addb2d5364fc1dfb43b6bb2eccab71ff0e",
    strip_prefix = "grammars-v4-b8e19fc211246be777205d1011290fe71ca18adc",
    url = "https://github.com/antlr/grammars-v4/archive/b8e19fc211246be777205d1011290fe71ca18adc.tar.gz",
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "42968f9134ba2c75c03bb271bd7bb062afb7da449f9b913c96e5be4ce890030a",
    strip_prefix = "buildtools-6.3.3",
    url = "https://github.com/bazelbuild/buildtools/archive/v6.3.3.tar.gz",
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
    sha256 = "593efead13e6606ead7cc5a37114a4338b3fbe3963e548ec56061641257d23b3",
    strip_prefix = "rules_cue-c46c97d53444519c69b1764b387ef1c3f31b1b23",
    url = "https://github.com/tnarg/rules_cue/archive/c46c97d53444519c69b1764b387ef1c3f31b1b23.zip",
)

http_archive(
    name = "com_google_google_java_format_source",
    sha256 = "0579aeff9f1127a9f18eb8167488de231c9a51279ec877ae8e047c56ac8b59b6",
    strip_prefix = "google-java-format-9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    url = "https://github.com/abergmeier-dsfishlabs/google-java-format/archive/9701afbdf2b29acb0660d6af1ea478842ffe40bc.tar.gz",
)

http_archive(
    name = "com_google_googletest",
    sha256 = "8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7",
    strip_prefix = "googletest-1.14.0",
    url = "https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz",
)

http_archive(
    name = "contrib_rules_jvm",
    sha256 = "4d62589dc6a55e74bbe33930b826d593367fc777449a410604b2ad7c6c625ef7",
    strip_prefix = "rules_jvm-0.19.0",
    url = "https://github.com/bazel-contrib/rules_jvm/archive/refs/tags/v0.19.0.tar.gz",
)

http_archive(
    name = "fmeum_rules_jni",
    sha256 = "01cfe5b6878094afabfb0f9315d69fbc63dd0839a07f580f56d2305bb9fcbc0e",
    strip_prefix = "rules_jni-0.9.1",
    url = "https://github.com/fmeum/rules_jni/archive/refs/tags/v0.9.1.tar.gz",
)

http_archive(
    name = "fmtlib",
    patch_cmds = [
        "mv support/bazel/.bazelversion .bazelversion",
        "mv support/bazel/BUILD.bazel BUILD.bazel",
        "mv support/bazel/WORKSPACE.bazel WORKSPACE.bazel",
    ],
    sha256 = "78b8c0a72b1c35e4443a7e308df52498252d1cefc2b08c9a97bc9ee6cfe61f8b",
    strip_prefix = "fmt-10.1.1",
    url = "https://github.com/fmtlib/fmt/archive/refs/tags/10.1.1.tar.gz",
)

http_archive(
    name = "com_google_googleapis",
    sha256 = "d8b2e7ebefedc7a9313cf75aabbcbd37bd066ad67a43f625ff284f6809c1a8af",
    strip_prefix = "googleapis-bd9393d6f6fc86c13f5763f16a9c7130b4ad4e8e",
    url = "https://github.com/googleapis/googleapis/archive/bd9393d6f6fc86c13f5763f16a9c7130b4ad4e8e.zip",
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
    url = "https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz",
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "91585017debb61982f7054c9688857a2ad1fd823fc3f9cb05048b0025c47d023",
    url = "https://github.com/bazelbuild/rules_go/releases/download/v0.42.0/rules_go-v0.42.0.zip",
)

http_archive(
    name = "io_bazel_rules_k8s",
    sha256 = "ce5b9bc0926681e2e7f2147b49096f143e6cbc783e71bc1d4f36ca76b00e6f4a",
    strip_prefix = "rules_k8s-0.7",
    urls = ["https://github.com/bazelbuild/rules_k8s/archive/refs/tags/v0.7.tar.gz"],
)

http_archive(
    name = "io_grpc_grpc_java",
    sha256 = "6a3052dc29684f057641b97cd80521df1c5b43ed2c0038e22ccb23717cb2c72e",
    strip_prefix = "grpc-java-1.57.2",
    url = "https://github.com/grpc/grpc-java/archive/v1.57.2.tar.gz",
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

# Used by rules_rust
http_archive(
    name = "platforms",
    sha256 = "8150406605389ececb6da07cbcb509d5637a3ab9a24bc69b1101531367d89d74",
    url = "https://github.com/bazelbuild/platforms/releases/download/0.0.8/platforms-0.0.8.tar.gz",
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
    name = "rules_cc",
    sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
    strip_prefix = "rules_cc-0.0.9",
    url = "https://github.com/bazelbuild/rules_cc/archive/0.0.9.tar.gz",
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "2a4d07cd64b0719b39a7c12218a3e507672b82a97b98c6a89d38565894cf7c51",
    strip_prefix = "rules_foreign_cc-0.9.0",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/0.9.0.tar.gz",
)

http_archive(
    name = "rules_haskell",
    sha256 = "298f6f0db23391274b4eca215daa01797d05699469048ef94540d5829b466377",
    strip_prefix = "rules_haskell-0.17",
    url = "https://github.com/tweag/rules_haskell/archive/refs/tags/v0.17.tar.gz",
)

http_archive(
    name = "rules_java",
    sha256 = "7b0d9ba216c821ee8697dedc0f9d0a705959ace462a3885fe9ba0347ba950111",
    url = "https://github.com/bazelbuild/rules_java/releases/download/6.5.1/rules_java-6.5.1.tar.gz",
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "8ac1c5c2a8681c398883bb2cabc18f913337f165059f24e8c55714e05757761e",
    strip_prefix = "rules_jvm_external-5.3",
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/5.3.tar.gz",
)

http_archive(
    name = "rules_kotlin",
    sha256 = "5766f1e599acf551aa56f49dab9ab9108269b03c557496c54acaf41f98e2b8d6",
    url = "https://github.com/bazelbuild/rules_kotlin/releases/download/v1.9.0/rules_kotlin-v1.9.0.tar.gz",
)

http_archive(
    name = "rules_perl",
    sha256 = "1550b46e02e3a9ed340073541afad8ad5ff1c3e1d841bd3958da5b097d72fa70",
    strip_prefix = "rules_perl-366b6aa76b12056a9e0cc23364686f25dcc41702",
    url = "https://github.com/bazelbuild/rules_perl/archive/366b6aa76b12056a9e0cc23364686f25dcc41702.tar.gz",
)

http_archive(
    name = "rules_proto",
    sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",
    strip_prefix = "rules_proto-4.0.0",
    url = "https://github.com/bazelbuild/rules_proto/archive/refs/tags/4.0.0.tar.gz",
)

http_archive(
    name = "rules_python",
    sha256 = "0a8003b044294d7840ac7d9d73eef05d6ceb682d7516781a4ec62eeb34702578",
    strip_prefix = "rules_python-0.24.0",
    url = "https://github.com/bazelbuild/rules_python/archive/0.24.0.tar.gz",
)

http_archive(
    name = "rules_rust",
    sha256 = "6357de5982dd32526e02278221bb8d6aa45717ba9bbacf43686b130aa2c72e1e",
    url = "https://github.com/bazelbuild/rules_rust/releases/download/0.30.0/rules_rust-v0.30.0.tar.gz",
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
    nogo = "@//tools/nogo",
    # Update in lockstep with go.mod
    version = "1.20.3",
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

load("@rules_kotlin//kotlin:repositories.bzl", "kotlin_repositories")

kotlin_repositories()

load("@rules_kotlin//kotlin:core.bzl", "kt_register_toolchains")

kt_register_toolchains()

load("@io_bazel_rules_docker//repositories:repositories.bzl", container_repositories = "repositories")

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//go:image.bzl", _go_image_repos = "repositories")

_go_image_repos()

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults", "k8s_repositories")

k8s_repositories()

k8s_defaults(
    name = "k8s_deploy",
    cluster = "satreix",
    kind = "deployment",
)

load("@com_google_googleapis//:repository_rules.bzl", "switched_rules_by_language")

switched_rules_by_language(
    name = "com_google_googleapis_imports",
    go = True,
    grpc = True,
)
