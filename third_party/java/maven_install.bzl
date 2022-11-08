load("@io_grpc_grpc_java//:repositories.bzl", "IO_GRPC_GRPC_JAVA_ARTIFACTS", "IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS")
load("@rules_jvm_external//:defs.bzl", _maven_install = "maven_install")

# View installed things:
# bazel query @maven//:all --output=build
def maven_install():
    _maven_install(
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
