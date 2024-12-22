return {
  {
    "nvim-cmp",
    dependencies = "lukas-reineke/cmp-rg",
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "rg",
        option = {
          debounce = 200,
          additional_arguments = "--smart-case",
          context_before = 2,
          context_after = 4,
        },
        keyword_length = 3,
      })
    end,
  },
}
