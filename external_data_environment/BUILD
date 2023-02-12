load("//:bazel/write_jdbc.bzl", "write_jdbc")

# export MY_JDBC_URL="jdbc:postgresql://localhost/test-prod"
# bazel build db --action_env=MY_JDBC_URL or bazel build db if create a .bazelrc file to specify automatically flags to be set 
# need to add both use_default_shell_env=True to the rule, and pass the --action_env flag 
# into the bazel build command to get the environment variables propagated.
write_jdbc(name="db")
