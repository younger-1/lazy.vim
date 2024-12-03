return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdd", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gdc", "<cmd>DiffviewFileHistory<cr>" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>" },
    },
    opts = function(_, opts)
      local actions = require("diffview.actions")
      return vim.tbl_deep_extend("force", opts, {
        keymaps = {
          view = {
            ["q"] = actions.close,
          },
          file_panel = {
            ["q"] = actions.close,
          },
          file_history_panel = {
            ["q"] = actions.close,
          },
        },
      })
    end,
  },
}
