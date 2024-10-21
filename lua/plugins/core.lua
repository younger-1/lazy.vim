return {
  {
    "LazyVim/LazyVim",
    ---@type LazyVimConfig
    opts = {
      colorscheme = "tokyonight", -- catppuccin
    },
    keys = {
      -- { "<leader>l", false }, -- TODO:not working
      { "<leader>ll", "<cmd>Lazy<cr>" },
      { "<leader>lx", "<cmd>LazyExtra<cr>" },
      { "<leader>ld", "<cmd>LazyDev<cr>" },
      { "<leader>cf", "<cmd>LazyFormat<cr>" },
      { "<leader>lf", "<cmd>LazyFormatInfo<cr>" },
      { "<leader>lh", "<cmd>LazyHealth<cr>" },
      { "<leader>lr", "<cmd>LazyRoot<cr>" },
      --
      { "<leader>li", "<cmd>LspInfo<cr>" },
      { "<leader>lI", "<cmd>LspInstall<cr>" },
      { "<leader>lm", "<cmd>Mason<cr>" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "<BS>",
        function()
          if vim.v.count >= 1 then
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
      { "<A-c>", LazyVim.ui.bufremove, desc = "Close buffer" },
      --
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Pick" },
      { "<leader>bq", "<cmd>BufferLinePickClose<cr>", desc = "Pick close" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close right" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close left" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
}
