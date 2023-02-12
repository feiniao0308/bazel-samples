load("//vars:single_variable.bzl", "single_variable")  # <1>

single_variable(name="STABLE_GIT_COMMIT")  # <2>
single_variable(name="CURRENT_TIME")

# We mark the package as being publically visible since otherwise, we can’t depend on its targets.
package(default_visibility = ["//visibility:public"])  # <3>

