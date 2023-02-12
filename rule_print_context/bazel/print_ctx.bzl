# tag::all[]
def _print_context(ctx):
  # tag::print_context[]
  print("==>environment is %s" % "${BUILD_IMAGE}")
  print(dir(ctx))
  print(dir(native))
  # end::print_context[]

  out = ctx.actions.declare_file("out")
  ctx.actions.write(output=out, content="")

  return [DefaultInfo(files=depset([out]))]

print_context = rule(
  implementation = _print_context,
)
# end::all[]
