def _seven_zip(ctx):
  out = ctx.actions.declare_file("{}.7z".format(ctx.label.name))

  inputs = [ ctx.file.version_data ]
  inputs.extend(ctx.files.archive_files)

  args = ctx.actions.args()
  args.add(out)
  args.add(ctx.file.version_data)
  args.add_all(ctx.files.archive_files)

  ctx.actions.run(
    executable=ctx.executable.zip_binary,
    arguments=[args],
    inputs=inputs,
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]

seven_zip = rule(
  implementation = _seven_zip,
  attrs = {
    "zip_binary": attr.label(
        executable=True,  # This label is special, since it points to an executable
        default=":_seven_zip_binary",  # The target name is the one we defined in the java_binary rule invocation.
        cfg="host",  # Executables must specify the cfg attribute. This can be either "host" if the executable is part of the build - i.e. a compiler, or "target" if the executable is part of the later runtime, i.e. testing.
    ),
    "version_data": attr.label(
        allow_single_file=True,
        mandatory=True,
    ),
    "archive_files": attr.label_list(
        allow_files=True,
        mandatory=True,
        allow_empty=False
    ),
  }
)
