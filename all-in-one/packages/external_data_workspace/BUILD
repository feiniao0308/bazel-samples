load("//:bazel/single_variable.bzl", "single_variable")
load("//:bazel/status.bzl", "status")

single_variable(name="STABLE_GIT_COMMIT")
single_variable(name="CURRENT_TIME")

status(
    name="status",
    # git_commit=":STABLE_GIT_COMMIT",
    # current_time=":CURRENT_TIME"
)
