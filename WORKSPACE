workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_gazelle",
    sha256 = "de69a09dc70417580aabf20a28619bb3ef60d038470c7cf8442fafcf627c21cb",
    urls = ["https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.24.0/bazel-gazelle-v0.24.0.tar.gz"],
)

http_archive(
    name = "bazelruby_rules_ruby",
    patch_args = ["-p1"],
    patches = [
        # A fix for https://github.com/bazelruby/rules_ruby/issues/79
        "//third_party:bazelruby_rules_ruby.patch",
    ],
    sha256 = "a598fadf23c0d8376813ca4a1b4a45f778544d83bf650b24dcfc2210f6db7d5f",
    strip_prefix = "rules_ruby-65d828b204ec32a49458c9b770f8db20774ac450",
    urls = ["https://github.com/bazelruby/rules_ruby/archive/65d828b204ec32a49458c9b770f8db20774ac450.tar.gz"],
)

http_archive(
    name = "cargo_raze",
    sha256 = "58ecdbae2680b71edc19a0f563cdb73e66c8914689b6edab258c8b90a93b13c7",
    strip_prefix = "cargo-raze-0.15.0",
    url = "https://github.com/google/cargo-raze/archive/v0.15.0.tar.gz",
)

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "884fc6a2a0bfeeb48f2713304fc314e5963bc46d2982f90debd82a42df5ae3f5",
    strip_prefix = "grammars-v4-e33d3516e3c343727a314e9961ae1d5d28b35436",
    urls = ["https://github.com/antlr/grammars-v4/archive/e33d3516e3c343727a314e9961ae1d5d28b35436.tar.gz"],
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "e3bb0dc8b0274ea1aca75f1f8c0c835adbe589708ea89bf698069d0790701ea3",
    strip_prefix = "buildtools-5.1.0",
    urls = ["https://github.com/bazelbuild/buildtools/archive/5.1.0.tar.gz"],
)

http_archive(
    name = "com_github_gflags_gflags",
    sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
    strip_prefix = "gflags-2.2.2",
    urls = ["https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.tar.gz"],
)

http_archive(
    name = "com_github_swagger_api_swagger_petstore",
    build_file_content = """exports_files(["src/main/resources/openapi.yaml"])""",
    sha256 = "ae350c7aff7b99465ad4f679613685a92a4350796ae9fcd8ef36952592fe5dfe",
    strip_prefix = "swagger-petstore-swagger-petstore-v3-1.0.11",
    urls = ["https://github.com/swagger-api/swagger-petstore/archive/refs/tags/swagger-petstore-v3-1.0.11.tar.gz"],
)

http_archive(
    name = "com_google_google_java_format_source",
    sha256 = "0579aeff9f1127a9f18eb8167488de231c9a51279ec877ae8e047c56ac8b59b6",
    strip_prefix = "google-java-format-9701afbdf2b29acb0660d6af1ea478842ffe40bc",
    urls = ["https://github.com/abergmeier-dsfishlabs/google-java-format/archive/9701afbdf2b29acb0660d6af1ea478842ffe40bc.tar.gz"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "8b28fdd45bab62d15db232ec404248901842e5340299a57765e48abe8a80d930",
    strip_prefix = "protobuf-3.20.1",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v3.20.1.tar.gz"],
)

http_archive(
    name = "com_google_googletest",
    sha256 = "1cd10b9d47eb14e3051f3ef316fb73b6651f0dd8068ac0d5253016b3058fef8a",
    strip_prefix = "googletest-bf66935e07825318ae519675d73d0f3e313b3ec6",
    urls = ["https://github.com/google/googletest/archive/bf66935e07825318ae519675d73d0f3e313b3ec6.zip"],
)

http_archive(
    name = "fmtlib",
    build_file = "//third_party:cc/fmtlib/BUILD.external",
    sha256 = "3d794d3cf67633b34b2771eb9f073bde87e846e0d395d254df7b211ef1ec7346",
    strip_prefix = "fmt-8.1.1",
    urls = ["https://github.com/fmtlib/fmt/archive/refs/tags/8.1.1.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "f2dcd210c7095febe54b804bb1cd3a58fe8435a909db2ec04e31542631cf715c",
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/v0.31.0/rules_go-v0.31.0.zip"],
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
    name = "jq",
    build_file = "//tools/jq:jq.BUILD.bazel",
    sha256 = "998c41babeb57b4304e65b4eb73094279b3ab1e63801b6b4bddd487ce009b39d",
    strip_prefix = "jq-1.4",
    urls = ["https://github.com/stedolan/jq/releases/download/jq-1.4/jq-1.4.tar.gz"],
)

http_archive(
    name = "openapi_tools_generator_bazel",
    sha256 = "c6e4c253f1ae0fbe4d4ded8a719f6647273141d0dc3c0cd8bb074aa7fc3c8d1c",
    urls = ["https://github.com/OpenAPITools/openapi-generator-bazel/releases/download/0.1.5/openapi-tools-generator-bazel-0.1.5.tar.gz"],
)

http_archive(
    name = "rules_antlr",
    patch_args = ["-p1"],
    patches = ["//third_party:rules_antlr/add_antlr_4.10.1.patch"],
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    urls = ["https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz"],
)

http_archive(
    name = "rules_cc",
    sha256 = "935e2644125fccb36fa858495697301f7834d980d0e16419943b9618af2771a4",
    strip_prefix = "rules_cc-0.0.1",
    url = "https://github.com/bazelbuild/rules_cc/archive/0.0.1.tar.gz",
)

http_archive(
    name = "rules_foreign_cc",
    sha256 = "6041f1374ff32ba711564374ad8e007aef77f71561a7ce784123b9b4b88614fc",
    strip_prefix = "rules_foreign_cc-0.8.0",
    urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/0.8.0.tar.gz"],
)

http_archive(
    name = "rules_java",
    sha256 = "8c376f1e4ab7d7d8b1880e4ef8fc170862be91b7c683af97ca2768df546bb073",
    urls = ["https://github.com/bazelbuild/rules_java/releases/download/5.0.0/rules_java-5.0.0.1.tar.gz"],
)

http_archive(
    name = "rules_jvm_external",
    sha256 = "2cd77de091e5376afaf9cc391c15f093ebd0105192373b334f0a855d89092ad5",
    strip_prefix = "rules_jvm_external-4.2",
    urls = ["https://github.com/bazelbuild/rules_jvm_external/archive/4.2.tar.gz"],
)

http_archive(
    name = "rules_python",
    sha256 = "cdf6b84084aad8f10bf20b46b77cb48d83c319ebe6458a18e9d2cebf57807cdd",
    strip_prefix = "rules_python-0.8.1",
    urls = ["https://github.com/bazelbuild/rules_python/archive/0.8.1.tar.gz"],
)

http_archive(
    name = "rules_rust",
    sha256 = "8ecdaa2ae6a1af4affe92f4bafd7e14aef35676e6cb97bda4bc7371af5480e7c",
    strip_prefix = "rules_rust-207ee4fbcf4bac4b4c1da24097b453bb7cfcd011",
    urls = ["https://github.com/bazelbuild/rules_rust/archive/207ee4fbcf4bac4b4c1da24097b453bb7cfcd011.tar.gz"],
)

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    urls = ["https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz"],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(
    version = "1.17.6",
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

# gazelle:repository go_repository name=io_bazel_rules_go importpath=github.com/bazelbuild/rules_go
# gazelle:repository_macro third_party/go/deps.bzl%go_dependencies
load("//third_party/go:deps.bzl", "go_dependencies")

go_dependencies()

gazelle_dependencies()

load("@rules_java//java:repositories.bzl", "rules_java_dependencies", "rules_java_toolchains")

rules_java_dependencies()

rules_java_toolchains()

load("@rules_python//python:repositories.bzl", "python_register_toolchains")

python_register_toolchains(
    name = "python3_10_2",
    python_version = "3.10.2",
)

load("@python3_10_2//:defs.bzl", "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

pip_parse(
    name = "pypi",
    python_interpreter_target = interpreter,
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

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.10.1")

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
