"""Generate a file using a template."""

load("@rules_python//python:defs.bzl", "py_binary")

def _py_entrypoint_impl(ctx):
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = ctx.outputs.source_file,
        substitutions = {
            "{NAME}": ctx.attr.name,
            "{PACKAGE}": ctx.attr.package,
            "{FUNCTION}": ctx.attr.function,
        },
    )

_py_entrypoint_file = rule(
    implementation = _py_entrypoint_impl,
    attrs = {
        "package": attr.string(mandatory = True),
        "function": attr.string(mandatory = True),
        "_template": attr.label(
            default = Label("//tools/python/entrypoint:entrypoint.py.tpl"),
            allow_single_file = True,
        ),
    },
    outputs = {"source_file": "%{name}.py"},
)

def py_entrypoint(name, package, function, **kargs):
    _py_entrypoint_file(
        name = name + "_entrypoint",
        package = package,
        function = function,
    )
    out = name + "_entrypoint.py"

    return py_binary(
        name = name,
        srcs = [out],
        main = out,
        **kargs
    )
