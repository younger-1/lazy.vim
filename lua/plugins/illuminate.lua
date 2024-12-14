return {
  { import = "lazyvim.plugins.extras.editor.illuminate" },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "]]", false },
        { "[[", false },
        { "<a-n>", false },
        { "<a-p>", false },
      })
    end,
  },
}
