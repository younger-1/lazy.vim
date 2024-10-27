return {
  "Wansmer/treesj",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      -- Use default keymaps
      -- (<space>m - toggle, <space>j - join, <space>s - split)
      use_default_keymaps = false,

      -- If line after join will be longer than max value,
      -- node will not be formatted
      max_join_length = 200,
    })

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = "*",
      callback = function()
        local opts = { buffer = true }
        if require("treesj.langs")["presets"][vim.bo.filetype] then
          vim.keymap.set("n", "gmm", "<cmd>TSJToggle<cr>", opts)
          vim.keymap.set("n", "gmM", function()
            require("treesj").toggle({ split = { recursive = true } })
          end, opts)
        end
      end,
    })
  end,
}
