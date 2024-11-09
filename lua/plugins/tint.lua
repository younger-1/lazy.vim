return {
  {
    "levouh/tint.nvim",
    event = "WinResized",
    config = function()
      require("tint").setup({})
    end,
  },
  {
    "sunjon/shade.nvim",
    enabled = false,
    event = "WinResized",
    config = function()
      require("shade").setup({})
    end,
  },
}
