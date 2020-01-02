def binary_test(name, binary, opt_style = "long", *args, **kwargs):
    native.sh_test(
        name = name,
        size = "small",
        srcs = ["//tools/test/binary:hello_world_test.sh"],
        args = [
            "$(location //tools/test/binary/cmd/hello_world_tester)",
            "--bin=$(location %s)" % binary,
            "--opt=" + opt_style,
        ],
        data = [
            binary,
            "//tools/test/binary/cmd/hello_world_tester",
        ],
        *args,
        **kwargs
    )
