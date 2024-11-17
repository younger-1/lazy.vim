return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/persistence/"),
    },
    -- stylua: ignore
    keys = {
      { "<leader>qc", function() require("persistence").load() end, desc = "Current Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Last Session" },
      { "<leader>qs", function() require("persistence").select() end,desc = "Select Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Session" },
      --
      { "<leader>qa", function() require("persistence").start() end, desc = "Autosave session" },
      { "<leader>qw", function() require("persistence").save() end, desc = "Save session" },
    },
  },
}
