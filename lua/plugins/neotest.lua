return {
  { import = "lazyvim.plugins.extras.test.core" },

  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio" },
    opts = {},
    keys = {
      {
        "<leader>td",
        function()
          require("neotest").run.run(vim.fn.expand("%:p:h"))
        end,
        desc = "Test files under buf dir",
      },
      {
        ---@type neotest.ResultStatus
        "<leader>t]",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Next failed test",
      },
      {
        "<leader>t[",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Prev failed test",
      },
    },
  },
}
