# tag::all[]
def archive(name, files, out):
    # The native module isn’t implicitly imported in libraries, unlike the BUILD or WORKSPACE files. You need to use native.genrule, not just genrule.
    native.genrule(  # <1>
        name=name,
        outs=[out],
        srcs=files,
        cmd="zip $(OUTS) $(SRCS)")
# end::all[]
