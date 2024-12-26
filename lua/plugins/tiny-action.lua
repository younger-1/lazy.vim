return {
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- event = "LspAttach",
    keys = {
      {
        "<leader>ca",
        function()
          require("tiny-code-action").code_action()
        end,
        desc = "Action preview",
        mode = { "n", "x" },
      },
    },
    opts = {
      --- The backend to use, currently only "vim", "delta" and "difftastic" are supported
      backend = "vim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(keys, {
        { "<leader>ca", false, mode = { "n", "x" } },
      })
    end,
  },
}
