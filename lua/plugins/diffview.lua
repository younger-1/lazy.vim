return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdd", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>" },
    },
    opts = {},
  },
}
