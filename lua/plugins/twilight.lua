return {
  "folke/twilight.nvim",
  cmd = "Twilight",
  keys = {
    { "<leader>zt", "<cmd>Twilight<cr>" },
  },
  config = function()
    require("twilight").setup({
      dimming = {
        alpha = 0.25, -- amount of dimming
      },
    })
  end,
}
