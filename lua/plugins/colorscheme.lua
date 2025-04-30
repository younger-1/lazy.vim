return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- tokyonight catppuccin
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/tokyonight.nvim",
    ---@module 'tokyonight'
    ---@type tokyonight.Config
    opts = {
      -- moon storm night day
      style = "moon",
      dim_inactive = true,
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      dim_inactive = { enabled = true, percentage = 0.8 },
    },
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
}
