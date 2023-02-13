load("//:bazel/custom_provider.bzl", "count_items", "print_count")

# bazelisk build //packages/provider:count
count_items(
    name="count",
    items=[1, 7, 13, 33],
)

# bazelisk build //packages/provider:print
print_count(
    name="print",
    rule_dep=":count",
)