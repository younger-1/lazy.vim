return {
  {
    "folke/paint.nvim",
    event = "LazyFile",
    opts = {
      ---@type PaintHighlight[]
      highlights = {
        -- paint @something in comments with Constant highlight
        {
          -- filter can be a table of buffer options that should match, or a function called with buf as param that should return true.
          filter = { filetype = "lua" },
          pattern = "%-%- (@%w+)",
          hl = "Constant",
          priority = 999, -- @see(my) https://github.com/folke/paint.nvim/pull/20
        },
        {
          filter = { filetype = "lua" },
          pattern = "%-%- .+ (@%w+)",
          hl = "String",
          priority = 999,
        },
      },
    },
  },
}
