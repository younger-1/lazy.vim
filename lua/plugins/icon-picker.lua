return {
  {
    "ziontee113/icon-picker.nvim",
    opts = { disable_legacy_commands = true },
    keys = {
      { mode = { "n", "x" }, "<leader>sii", "<cmd>IconPickerNormal<cr>", desc = "Icons" },
      { mode = { "n", "x" }, "<leader>sis", "<cmd>IconPickerNormal symbols<cr>", desc = "Symbols" },
      { mode = { "n", "x" }, "<leader>sie", "<cmd>IconPickerNormal emoji<cr>", desc = "Emoji" },
      { mode = { "n", "x" }, "<leader>siN", "<cmd>IconPickerNormal nerd_font<cr>", desc = "Nerd font" },
      { mode = { "n", "x" }, "<leader>sin", "<cmd>IconPickerNormal nerd_font_v3<cr>", desc = "Nerd font V3" },
      { mode = { "n", "x" }, "<leader>sia", "<cmd>IconPickerNormal alt_font<cr>", desc = "Alt font" },
      { mode = { "n", "x" }, "<leader>sic", "<cmd>IconPickerNormal html_colors<cr>", desc = "Colors" },
    },
  },
}
