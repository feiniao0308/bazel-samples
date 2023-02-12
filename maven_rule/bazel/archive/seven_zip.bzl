# tag::all[]
# tag::rule_implementation[]
def _seven_zip(ctx):
  out = ctx.actions.declare_file("{}.7z".format(ctx.label.name))  # <1>

  inputs = [ ctx.file.version_data ]  # <2>
  inputs.extend(ctx.files.archive_files) # <3>

  args = ctx.actions.args()
  args.add(out)  # <1>
  args.add(ctx.file.version_data)  # <2>
  args.add_all(ctx.files.archive_files) # <3>

  ctx.actions.run(
    executable=ctx.executable._seven_zip_binary,  # <4>
    arguments=[args],
    inputs=inputs,
    outputs=[out])

  return [DefaultInfo(files=depset([out]))]
# end::rule_implementation[]

# tag::rule_definition[]
# PAGE - 45
seven_zip = rule(
  implementation = _seven_zip,
  attrs = {
    "_seven_zip_binary": attr.label(
        executable=True,  # <1> This label is special, since it points to an executable
        default=":_seven_zip_binary",  # <2> The target name is the one we defined in the java_binary rule invocation.
        cfg="host",  # <3> Executables must specify the cfg attribute. This can be either "host" if the executable is part of the build - i.e. a compiler, or "target" if the executable is part of the later runtime, i.e. testing.
    ),
    "version_data": attr.label(  # <4>
        allow_single_file=True,
        mandatory=True,
    ),
    "archive_files": attr.label_list(  # <5>
        allow_files=True,
        mandatory=True,
        allow_empty=False
    ),
  }
)
# end::rule_definition[]
# end::all[]
