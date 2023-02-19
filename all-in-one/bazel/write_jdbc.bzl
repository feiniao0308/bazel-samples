def _write_jdbc(ctx):
  out = ctx.actions.declare_file("{}.cfg".format(ctx.label.name))

  args = ctx.actions.args()
  args.add(out)

  ctx.actions.run_shell(
    command="""
      echo "JDBC is $MY_JDBC_URL"
      echo "$MY_JDBC_URL" > $1
    """,
    # Note the use of the use_default_shell_env=True . 
    # Without this flag, the variable won’t be accessible to our action. 
    # We need to enable it for our action explicitly. This is the first part of getting the variables in: 
    # telling Bazel this action requires the environment variables injected.
    use_default_shell_env=True,
    arguments=[args],
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

write_jdbc = rule(
  implementation = _write_jdbc,
)
