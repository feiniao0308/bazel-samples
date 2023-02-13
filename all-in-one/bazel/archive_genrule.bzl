# The native module isn’t implicitly imported in libraries, unlike the BUILD 
# or WORKSPACE files. You need to use native.genrule, not just genrule.
# $(..) is a template
def archive(name, srcs, out):
    # using print(dir(native)) to list all pre-written rules
    # e.g. cc_binary, cc_library, exports_files, filegroup, genrule, glob
    native.genrule(
        name=name,
        outs=[out],
        srcs=srcs,
        cmd="zip $(OUTS) $(SRCS)")
