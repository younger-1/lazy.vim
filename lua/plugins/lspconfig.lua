return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
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
    },
  },
}
