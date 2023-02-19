load("//:bazel/archive.bzl", "archive")
load("//:bazel/archive_genrule.bzl", archive_genrule = "archive")

archive(
  name="documentation",
  srcs=[
    "README.md",
  ],
  out="documentation.zip",
)

archive(
  name="release",
  srcs=[
    "RELEASE.md",
  ],
  out="release.zip",
)

archive(
  name="all",
  srcs=[
    "README.md",
    "RELEASE.md",
  ],
  out="all.zip",
)

# no load statement for this rule
# Bazel has a bunch of prepackaged rules targeted at various builds. 
# These belong in the native package, and all the rule definitions are already visible 
# as global rules into our BAZEL files.
genrule(
  name="documentation_v2",
  srcs=[
    "README.md",
  ],
  outs=[
      "documentation_v2.zip",
  ],
  cmd="zip $(OUTS) $(SRCS)"
)

archive_genrule(
  name="documentation_v3",
  srcs=[
    "RELEASE.md",
  ],
  out="documentation_v3.zip",
)