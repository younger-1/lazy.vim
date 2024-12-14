-- tab navigation jumping between significant code elements, such as brackets, quotes, etc.
return {
  "roobert/tabtree.nvim",
  event = "LazyFile",
  opts = {
    key_bindings = {
      next = "<Tab>",
      previous = "<S-Tab>",
    },
  },
}
