def _link(ctx):
  out = ctx.actions.declare_file(ctx.attr.out)

  args = ctx.actions.args()
  args.add_all(ctx.files.objs)

  args.add("-o")
  args.add(out)
  args.add("-B")
  args.add("/usr/lib/gcc/x86_64-linux-gnu/7")
  args.add("-B")
  args.add("/usr/bin")

  ctx.actions.run(executable="/usr/bin/gcc",
                  arguments=[args],
                  inputs=ctx.files.objs,
                  outputs=[out])

  return [DefaultInfo(files=depset([out]))]

link = rule(
  implementation = _link,
  attrs = {
    "objs": attr.label_list(
      allow_files=True,
      mandatory=True,
      allow_empty=False,
    ),
    "out": attr.string(),
  }
)

# glob gets resolved in the loading phase, not the analysis. 
# That’s why we cannot use glob() inside a rule implementation, 
# but we can use it in macros.
# srcs = glob([
#     "src/main/java/**/*.java"
# ])