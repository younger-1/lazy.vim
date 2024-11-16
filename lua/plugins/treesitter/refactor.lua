---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "gmr",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gmd",
            list_definitions = "gml",
            list_definitions_toc = "gmo",
            goto_next_usage = "gmn",
            goto_previous_usage = "gmp",
          },
        },
      },
    },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-refactor" },
    },
  },
}
