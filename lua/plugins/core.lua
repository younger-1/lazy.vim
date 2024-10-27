return {
  {
    "LazyVim/LazyVim",
    ---@type LazyVimConfig
    opts = {
      news = {
        -- When enabled, NEWS.md will be shown when changed.
        -- This only contains big new features and breaking changes.
        lazyvim = true,
        -- Same but for Neovim's news.txt
        neovim = true,
      },
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
}
