---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "BufReadPost",
  priority = 1000, -- needs to be loaded in first
  opts = {
    preset = "modern", -- Can be: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
    options = {
      -- Show the source of the diagnostic.
      show_source = true,

      -- If multiple diagnostics are under the cursor, display all of them.
      multiple_diag_under_cursor = true,

      -- Enable diagnostic message on all lines.
      multilines = true,
    },
  },
  config = function(_, opts)
    vim.diagnostic.config({ virtual_text = false })

    require("tiny-inline-diagnostic").setup(opts)
  end,
}
