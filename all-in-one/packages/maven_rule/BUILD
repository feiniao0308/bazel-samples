load("//:bazel/seven_zip.bzl", "seven_zip")

java_binary(
  name = "_seven_zip_binary",
  srcs = glob([
    "src/main/java/**/*.java"
  ]),
  main_class = "com.germaniumhq.ArchiveRule",
  deps = [
    "@maven//:org_apache_commons_commons_compress",
    "@maven//:commons_io_commons_io",
    "@maven//:org_tukaani_xz",
  ]
)

seven_zip(
  name="data",
  zip_binary=":_seven_zip_binary",
  version_data="//packages/maven_rule/src/version:data.txt",
  archive_files=[
    "src/files/users.txt",
    "src/files/groups.txt",
  ]
)
