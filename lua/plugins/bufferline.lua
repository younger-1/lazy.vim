return {
  {
    "akinsho/bufferline.nvim",
    -- event = "LazyFile",
    keys = {
      {
        "<BS>",
        function()
          if vim.v.count > 0 then
            vim.cmd("BufferLineGoToBuffer " .. vim.v.count)
          else
            vim.cmd("silent! b#")
          end
        end,
        desc = "Buffer Goto",
      },
      { "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<A-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<A-S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "<A-S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      --
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick" },
      { "<leader>bq", "<cmd>BufferLinePickClose<cr>", desc = "Pick close" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close right" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close left" },
    },
    ---@module 'bufferline'
    ---@type bufferline.UserConfig
    opts = {
      options = {
        auto_toggle_bufferline = false,
      },
    },
  },
}
