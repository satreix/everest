# Adapted from fortran rules from Austin Schuh:
# https://groups.google.com/forum/#!topic/bazel-discuss/x81efJSmBMk
#
# This is a bit of a hack in the sense that it simply invokes the C
# compiler on the .f files and hopes it does the right thing. Requires
# gfortran to be installed.
#
# This should become less of a problem if/when we build our own compiler.

def _single_fortran_object_impl(ctx):
    toolchain_cflags = (ctx.fragments.cpp.compiler_options([]) +
                        ctx.fragments.cpp.c_options +
                        ctx.fragments.cpp.unfiltered_compiler_options([]) + ["-fPIC"])

    cmd = [ctx.fragments.cpp.compiler_executable] + toolchain_cflags + ["-c", ctx.file.src.path, "-o", ctx.outputs.pic_o.path]

    # Filter out compiler flags that are not relevant for fortran
    filtered_cmd = []
    exclude_flags = [
        "-fcolor-diagnostics",
        "-fno-canonical-system-headers",
        "-Wswitch-enum",
        "-Wpointer-arith",
        "-Wcast-qual",
        "-Wwrite-strings",
        "-Wsign-compare",
        "-Wformat=2",
        "-Werror",
        "-Wno-builtin-macro-redefined",
    ]

    for flag in cmd:
        if flag not in exclude_flags:
            filtered_cmd.append(flag)

    # TODO: silence conversion warnings with -Wno-conversion

    ctx.action(
        inputs = [ctx.file.src],
        outputs = [ctx.outputs.pic_o],
        mnemonic = "Fortran",
        command = " ".join(filtered_cmd),
        progress_message = "Building %s" % ctx.file.src.short_path,
    )

def _define_fortran_output(src):
    if not src.name.lower().endswith(".f"):
        fail("Fortran files must end in '.f'", "src")

    fortran_file_base = src.name[:-2]
    return {
        "pic_o": fortran_file_base + ".pic.o",
    }

_single_fortran_object = rule(
    implementation = _single_fortran_object_impl,
    attrs = {
        "src": attr.label(single_file = True, allow_files = FileType([".f", ".F"])),
        "cc_libs": attr.label_list(providers = ["cc"]),
    },
    outputs = _define_fortran_output,
    fragments = [
        "cpp",
    ],
)

def fortran_library(name, srcs, deps = [], visibility = None):
    pic_o_files = []
    for src in srcs:
        pic_o_file = src[:-2] + ".pic.o"
        _single_fortran_object(
            name = name + "_" + pic_o_file,
            src = src,
            visibility = ["//visibility:private"],
        )
        pic_o_files.append(pic_o_file)

    native.cc_library(
        name = name,
        deps = deps,
        srcs = pic_o_files,
        linkopts = [
            "-lgfortran",
        ],
        visibility = visibility,
    )
