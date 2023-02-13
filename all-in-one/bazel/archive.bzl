# context object: https://docs.bazel.build/versions/main/skylark/lib/ctx.html
# We can use ctx.file.param_name to access single file, or ctx.files.param_name to access lists of files
def _archive(ctx):
  # out_file = ctx.actions.declare_file(ctx.attr.out)
  # Since there is always a name parameter that identifies the target, 
  # we’ll leverage that one, instead of adding an extra parameter to the rule. 
  # This parameter is accessible in the rule context as ctx.label 
  out_file = ctx.actions.declare_file(ctx.label.name)
  args = ctx.actions.args()

  args.add(out_file)
  args.add_all(ctx.files.srcs)

  ctx.actions.run(
    executable="zip",
    arguments=[args],
    inputs=ctx.files.srcs,
    outputs=[out_file])

  return [DefaultInfo(files=depset([out_file]))]

archive = rule(
  implementation = _archive,
  attrs = {
    "srcs": attr.label_list(allow_files=True),
    # "out": attr.string(mandatory=True),
  }
)
