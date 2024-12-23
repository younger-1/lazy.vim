return {
  {
    "OXY2DEV/helpview.nvim",
    ft = "help",
    cmd = "Helpview",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      modelines = {
        -- • minimal, uses a single line to show everything.
        -- • expanded, uses a new line for every option.
        style = "expanded",
      },
    },
  },
}
