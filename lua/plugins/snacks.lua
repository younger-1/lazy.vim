return {
  "folke/snacks.nvim",
  keys = {
    {
      "<A-c>",
      function()
        Snacks.bufdelete()
      end,
      desc = "Close buffer",
    },
  },
  ---@type snacks.Config
  opts = {
    statuscolumn = {
      folds = {
        open = true, -- show open fold icons
        git_hl = true, -- use Git Signs hl for fold icons
      },
    },
  },
}
