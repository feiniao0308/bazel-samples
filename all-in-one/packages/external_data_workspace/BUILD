load("//:bazel/single_variable.bzl", "single_variable")
load("//:bazel/status.bzl", "status")

single_variable(name="STABLE_GIT_COMMIT")
single_variable(name="CURRENT_TIME")

status(
    name="status",
    # git_commit=":STABLE_GIT_COMMIT",
    # current_time=":CURRENT_TIME"
)

# bazelisk query "deps(//packages/external_data_workspace:status)"
# bazelisk query "deps(//packages/external_data_workspace:status)" --output label_kind
# bazelisk query "deps(//packages/external_data_workspace:status)" --output package
# bazelisk query "deps(//packages/external_data_workspace:status)" --output graph --notool_deps > graph.dot
# we can render using dot (https://graphviz.org/): dot -Tpng -Ograph.png graph.dot