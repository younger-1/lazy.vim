return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- disbale markdownlint-cli2
        markdown = {},
      },
    },
  },
}
