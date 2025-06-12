return {
  {
    "LazyVim/LazyVim",
    ---@type LazyVimConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
        -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
        -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
      },
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
      --
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
      { "<leader>lc", "<cmd>ConformInfo<cr>" },
    },
  },
}
