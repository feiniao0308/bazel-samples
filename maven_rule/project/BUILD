load("//bazel/archive:seven_zip.bzl", "seven_zip")

# PAGE - 47
# bazel build //project:data
# query:
# 1. bazel query "deps(//project:data)" --output label_kind
# 2. bazel query "deps(//project:data)" --output package
# 3. bazel query "deps(//project:data)" --output package --notool_deps
# 4. bazel query "deps(//project:data)" --output graph --notool_deps > graph-out/graph.dot
# 5. dot -Tpng -Ograph.png graph.dot
seven_zip(
  name="data",
  version_data="//version:data.txt",
  archive_files=[
    "users.txt",
    "groups.txt",
  ]
)
