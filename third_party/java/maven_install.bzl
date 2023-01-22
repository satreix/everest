load("@io_grpc_grpc_java//:repositories.bzl", "IO_GRPC_GRPC_JAVA_ARTIFACTS", "IO_GRPC_GRPC_JAVA_OVERRIDE_TARGETS")
load("@rules_jvm_external//:defs.bzl", _maven_install = "maven_install")

JUNIT_VERSION = "5.8.1"
JUNIT_PLATFORM_VERSION = "1.8.1"

# View installed things:
# bazel query @maven//:all --output=build
def maven_install():
    _maven_install(
        artifacts = [
            "com.google.googlejavaformat:google-java-format:1.7",
            "commons-cli:commons-cli:1.4",
            "org.junit.jupiter:junit-jupiter-api:" + JUNIT_VERSION,
            "org.junit.jupiter:junit-jupiter-engine:" + JUNIT_VERSION,
            "org.junit.platform:junit-platform-launcher:" + JUNIT_PLATFORM_VERSION,
            "org.junit.platform:junit-platform-reporting:" + JUNIT_PLATFORM_VERSION,
            "org.junit.vintage:junit-vintage-engine:" + JUNIT_VERSION,
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
