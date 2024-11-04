return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- disable gofumpt
        go = { "goimports" },
      },
    },
  },
}
