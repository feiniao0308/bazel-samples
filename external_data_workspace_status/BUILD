load("//:bazel/status.bzl", "status")

# PAGE - 57
# Stable ones have the name beginning with STABLE_ and get written into the stable-status.txt . This file is a regular file available as an input for an action using the ctx.info_file field, from the action context.
# Volatile variables are all the other variables, and get persisted into the volatile-status.txt . This additional file is also available for input in actions, from the ctx.version_file of the action context.
# Changes in the volatile-status.txt (ctx.version_file ) do not invalidate caches for actions that depend on it. 
# workspace_status_command that will run outside the sandbox , and before the actual build
status(name="status")
