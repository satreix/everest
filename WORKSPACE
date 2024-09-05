workspace(name = "everest")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_antlr_grammars_v4",
    build_file_content = """exports_files(glob(["**/*.g4"]), visibility = ["//visibility:public"])""",
    sha256 = "62c715358e3c2bd4abb8b9eb2850d2b3b5ff45617bc63a7f09b93459a8d7e0e2",
    strip_prefix = "grammars-v4-cc1e84841c7757b098b72044aae3c6703f64f596",
    url = "https://github.com/antlr/grammars-v4/archive/cc1e84841c7757b098b72044aae3c6703f64f596.tar.gz",
)

http_archive(
    name = "com_github_swagger_api_swagger_petstore",
    build_file_content = """exports_files(["src/main/resources/openapi.yaml"])""",
    sha256 = "ae350c7aff7b99465ad4f679613685a92a4350796ae9fcd8ef36952592fe5dfe",
    strip_prefix = "swagger-petstore-swagger-petstore-v3-1.0.11",
    url = "https://github.com/swagger-api/swagger-petstore/archive/refs/tags/swagger-petstore-v3-1.0.11.tar.gz",
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
    patches = ["//third_party/rules_antlr:add_antlr_4.13.0.patch"],
    sha256 = "26e6a83c665cf6c1093b628b3a749071322f0f70305d12ede30909695ed85591",
    strip_prefix = "rules_antlr-0.5.0",
    url = "https://github.com/marcohu/rules_antlr/archive/0.5.0.tar.gz",
)

http_archive(
    name = "uncrustify",
    build_file_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])""",
    sha256 = "ad0a7b1f68aa3527d1b89d177d192385fe41b830d46167bde3c3b578e9b0ed06",
    strip_prefix = "uncrustify-uncrustify-0.70.1",
    url = "https://github.com/uncrustify/uncrustify/archive/uncrustify-0.70.1.tar.gz",
)

load("@rules_antlr//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies("4.13.0")

load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

openapi_tools_generator_bazel_repositories(
    openapi_generator_cli_version = "5.4.0",
    sha256 = "f3ed312310e390324b33ba2ffff290ce812935207a1493ec5c098d0a441be51c",
)
