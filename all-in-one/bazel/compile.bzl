def _compile(ctx):
  output = []

  for f in ctx.files.srcs:
    out = ctx.actions.declare_file(
        "{}.o".format(f.path[:-2]))
    print("compiling {} -> {}".format(f, out))

    inputs = [f]
    inputs.extend(ctx.files.hdrs)

    args = ctx.actions.args()
    args.add(f)
    args.add("-o")
    args.add(out)

    args.add("-c")
    args.add("-I/usr/lib/gcc/x86_64-linux-gnu/7/include")

    output.append(out)

    ctx.actions.run(executable="gcc",
                    arguments=[args],
                    inputs=inputs,
                    outputs=[out])

  return [DefaultInfo(files=depset(output))]

compile = rule(
  implementation = _compile,
  attrs = {
    "srcs": attr.label_list(
      allow_files=True,
      mandatory=True,
      allow_empty=False,
    ),
    "hdrs": attr.label_list(allow_files=True),
    "flags": attr.string(),
  }
)
