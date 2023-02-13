load(":bazel/compile.bzl", "compile")
load(":bazel/link.bzl", "link")
load(":bazel/archive.bzl", "archive")

# Macros are pure functions that invoke rules.
def application(name, srcs, hdrs, extra_files):
    # compile_target_name = "{}-compile".format(name)
    link_target_name = "{}-link".format(name)

    # compile(
    #   name=compile_target_name,
    #   srcs=srcs,
    #   hdrs=hdrs,
    # )

    # link(
    #   name=link_target_name,
    #   objs=[compile_target_name],
    #   out="main",
    # )

    # Both compilation and linking are done by native cc_binary
    native.cc_binary(
        name=link_target_name,
        srcs=srcs + hdrs,
    )

    archive_files = [link_target_name]
    archive_files.extend(extra_files)

    archive(
      name=name,
      srcs=archive_files,
    )
