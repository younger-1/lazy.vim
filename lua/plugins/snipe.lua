return {
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "gb",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Snipe buffer menu",
      },
    },
    opts = {
      ui = {
        position = "cursor",
        text_align = "file-first",
      },
      navigate = {
        cancel_snipe = "q",
        close_buffer = "X",
        open_vsplit = "<C-v>",
        open_split = "<C-s>",
      },
    },
  },
  -- {
  --   "kungfusheep/snipe-lsp.nvim",
  --   event = "VeryLazy",
  --   -- keys = "g<cr>",
  --   dependencies = "leath-dub/snipe.nvim",
  --   opts = {
  --     open_symbols_menu = "g<cr>",
  --     open_symbols_menu_for_split = "g<cr>s",
  --     open_symbols_menu_for_vsplit = "g<cr>v",
  --   },
  -- },
}
