Counter = provider()

def _count_items(ctx):
    item_count = len(ctx.attr.items)
    # A custom provider can have any fields. We could also have Counter(count=item_count, some_str="yay"), etc.
    return [Counter(count=item_count, info="hello custom provider!")]

count_items = rule(
  implementation = _count_items,
  attrs = {
    "items": attr.int_list(),
  }
)

def _print_count(ctx):
  rule_dep = ctx.attr.rule_dep
  # access provider by label[provider_name]
  print(rule_dep[Counter])

  # we can also access the items from the struct directly:
  print("Count is {}, infos is {}".format(rule_dep[Counter].count, rule_dep[Counter].info))

  return []

print_count = rule(
  implementation = _print_count,
  attrs = {
    "rule_dep": attr.label()
  }
)