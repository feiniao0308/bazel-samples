def _single_variable(ctx):
  out = ctx.actions.declare_file("{}.value".format(ctx.label.name))

  if ctx.label.name.startswith("STABLE_"):
    # stable-status.txt
    input_file = ctx.info_file
  else:
    # volatile-status.txt
    input_file = ctx.version_file

  args = ctx.actions.args()
  args.add(ctx.label.name)
  args.add(input_file)
  args.add(out)

  ctx.actions.run_shell(
    command="""
      grep "^$1 " $2 | sed -e "s/^$1 //" > $3
    """,
    arguments=[args],
    inputs=[input_file],
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

single_variable = rule(
  implementation = _single_variable,
)
