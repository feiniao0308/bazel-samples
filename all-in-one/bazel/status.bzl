def _status(ctx):
  print(dir(ctx))
  out = ctx.actions.declare_file(ctx.label.name)
  print("writing status to {}".format(out))

  args = ctx.actions.args()
  args.add(ctx.file.git_commit)
  args.add(ctx.file.current_time)
  args.add(out)

  ctx.actions.run_shell(
    command="""
      echo "Project Status $(cat $1) built at $(cat $2)." > $3
    """,
    arguments=[args],
    inputs=[ctx.file.git_commit, ctx.file.current_time],
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

status = rule(
  implementation = _status,
  attrs = {
    "git_commit": attr.label(allow_single_file=True, default="//packages/external_data_workspace:STABLE_GIT_COMMIT"),
    "current_time": attr.label(allow_single_file=True, default="//packages/external_data_workspace:CURRENT_TIME"),
  }
)
