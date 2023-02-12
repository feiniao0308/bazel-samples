load("//:bazel/counter.bzl", "Counter")  # <1>

def _count_items(ctx):
    item_count = len(ctx.attr.items)    # <2>
    # A custom provider can have any fields. We could also have Counter(count=item_count, some_str="yay"), etc.
    return [Counter(count=item_count)]  # <3>

count_items = rule(
  implementation = _count_items,
  attrs = {
    "items": attr.int_list(),
  }
)
