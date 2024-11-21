return {
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    config = function()
      require("nvim-navic").setup({
        depth_limit = 2,
        depth_limit_indicator = "..",
        lazy_update_context = true, -- If true, turns off context updates for the "CursorMoved" event.
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("_navic", {}),
        callback = function(ctx)
          if not ctx.data then
            return
          end
          local client = vim.lsp.get_client_by_id(ctx.data.client_id)
          local bufnr = ctx.buf
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
          end
        end,
      })
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
    keys = {
      {
        "g<space>",
        "<cmd>Navbuddy<cr>",
      },
    },
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-navbuddy").setup({
        lsp = {
          auto_attach = false,
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("_nabuddy", {}),
        callback = function(ctx)
          if not ctx.data then
            return
          end
          local client = vim.lsp.get_client_by_id(ctx.data.client_id)
          local bufnr = ctx.buf
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navbuddy").attach(client, bufnr)
          end
        end,
      })
    end,
  },
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    event = "LazyFile",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function()
      require("barbecue").setup({
        ---Whether to attach navic to language servers automatically.
        attach_navic = false,
        ---Whether to create winbar updater autocmd.
        create_autocmd = false,
      })

      -- Gain better performance when moving the cursor around
      vim.api.nvim_create_autocmd({
        U.has("nvim-0.9") and "WinResized" or "WinScrolled",
        "CursorHold",
        "BufWinEnter",
        "InsertLeave",
        -- 'BufModifiedSet', -- include this if you have set `show_modified` to `true`
      }, {
        group = vim.api.nvim_create_augroup("_barbecue", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
}
