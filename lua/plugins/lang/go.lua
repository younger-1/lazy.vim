return {
  { import = "lazyvim.plugins.extras.lang.go" },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = false,
              codelenses = {
                gc_details = true,
              },
              -- @see https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
              hints = {
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
              },
            },
          },
        },
      },
    },
  },

  -- disable gofumpt
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "golangci-lint",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
  },
}
