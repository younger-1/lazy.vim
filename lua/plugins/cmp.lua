return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
    },
    opts = function()
      LazyVim.on_load("nvim-cmp", function()
        local cmp = require("cmp")
        local cmdline_map = cmp.mapping.preset.cmdline({
          -- ['<C-n>'] = {
          --   c = function(fallback) fallback() end,
          -- },
          -- ['<C-p>'] = {
          --   c = function(fallback) fallback() end,
          -- },
          -- ["<C-e>"] = vim.NIL,
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
          mapping = cmdline_map,
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
          mapping = cmdline_map,
          sources = {
            { name = "buffer" },
          },
        })
      end)
    end,
  },
}
