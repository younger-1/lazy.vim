return {
  {
    "trevorhauter/gitportal.nvim",
    cmd = "GitPortal",
    opts = {},
    keys = {
      { "<leader>gy", "<cmd>GitPortal copy_link_to_clipboard<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>gY", "<cmd>GitPortal browse_file<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
