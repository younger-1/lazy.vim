return {
  { import = "lazyvim.plugins.extras.ui.smear-cursor" },
  {
    "sphamba/smear-cursor.nvim",
    cond = vim.env.TERM ~= "xterm-kitty" and vim.g.neovide == nil,
  },
}
