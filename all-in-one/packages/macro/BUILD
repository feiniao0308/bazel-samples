load("//:bazel/application.bzl", "application")

# bazelisk build //packages/macro:main.zip
application(
  name="main.zip",
  srcs=[
    "main.c",
    "print.c",
  ],
  hdrs=[
    "print.h",
  ],
  extra_files=[
    "README.md",
  ],
)