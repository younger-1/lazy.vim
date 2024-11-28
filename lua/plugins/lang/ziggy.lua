vim.filetype.add({
  extension = {
    ziggy = "ziggy",
    zgy = "ziggy",
    ["ziggy-schema"] = "ziggy_schema",
    ["zgy-schema"] = "ziggy_schema",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lsp_for_ziggy", {}),
  pattern = "ziggy",
  callback = function()
    vim.lsp.start({
      name = "Ziggy LSP",
      cmd = { "ziggy", "lsp" },
      root_dir = vim.uv.cwd(),
      flags = { exit_timeout = 1000 },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lsp_for_ziggy_schema", {}),
  pattern = "ziggy_schema",
  callback = function()
    vim.lsp.start({
      name = "Ziggy-Schema LSP",
      cmd = { "ziggy", "lsp", "--schema" },
      root_dir = vim.uv.cwd(),
      flags = { exit_timeout = 1000 },
    })
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "ziggy",
        "ziggy_schema",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        ziggy = {
          inherit = false,
          command = "ziggy",
          stdin = true,
          args = { "fmt", "--stdin" },
        },
        ziggy_schema = {
          inherit = false,
          command = "ziggy",
          stdin = true,
          args = { "fmt", "--stdin-schema" },
        },
      },

      formatters_by_ft = {
        ziggy = { "ziggy" },
        ziggy_schema = { "ziggy_schema" },
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {
      filetype = {
        ziggy = { glyph = "" },
        ziggy_schema = { glyph = "" },
      },
    },
  },
}
