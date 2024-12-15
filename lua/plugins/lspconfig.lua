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
        { "gh", function() vim.lsp.buf.hover() end, desc = "Hover" },
        { "<C-w>d", function()
          vim.cmd.wincmd('o')
          vim.cmd.vsplit()
          vim.lsp.buf.definition()
        end, desc = "Def" },
        { "<C-w>y", function()
          vim.cmd.wincmd('o')
          vim.cmd.vsplit()
          vim.lsp.buf.type_definition()
        end, desc = "Type Def" },
        { "<C-w>i", function()
          vim.cmd.wincmd('o')
          vim.cmd.vsplit()
          vim.lsp.buf.references()
        end, desc = "Ref" },
        { "<C-w>I", function()
          vim.cmd.wincmd('o')
          vim.cmd.vsplit()
          vim.lsp.buf.implementation()
        end, desc = "Impl" },
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
