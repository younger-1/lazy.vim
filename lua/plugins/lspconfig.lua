---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(keys, {
        { "<leader>cl", false },
        { "K", false },
        { "gh", function() return vim.lsp.buf.hover() end, desc = "Hover" },
      })

      ---@type PluginLspOpts
      local cfg = {
        diagnostics = {
          float = {
            border = "single",
          },
        },
        servers = {
          lua_ls = {
            cmd = { "lua-language-server", "--locale=zh-CN" },
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                  special = {
                    spec = "require",
                  },
                },
                completion = {
                  -- autoRequire = false,
                  -- postfix = '='
                  callSnippet = "Replace",
                },
                diagnostics = {
                  globals = {
                    "vim",
                  },
                  disable = {
                    -- "missing-parameter",
                    -- "cast-local-type",
                  },
                },
              },
            },
          },
          -- pyright will be automatically installed with mason and loaded with lspconfig
          pyright = {},
        },
        setup = {},
      }
      return vim.tbl_deep_extend("force", opts, cfg)
    end,
  },
}
