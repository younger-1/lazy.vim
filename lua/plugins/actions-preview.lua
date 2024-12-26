return {
  {
    "aznhe21/actions-preview.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    -- event = "LspAttach",
    keys = {
      {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "Action preview",
        mode = { "n", "x" },
      },
    },
    opts = function()
      return {
        diff = {
          -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
          algorithm = "patience",
          ignore_whitespace = true,
        },
        backend = { "nui", "telescope" },
        -- priority list of external command to highlight diff disabled by defalt, must be set by yourself
        highlight_command = {
          require("actions-preview.highlight").delta(),
          require("actions-preview.highlight").diff_so_fancy(),
          require("actions-preview.highlight").diff_highlight(),
        },
      }
    end,
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
