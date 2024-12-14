return {
  {
    "abecodes/tabout.nvim",
    event = "InsertCharPre",
    keys = function()
      -- A multiline tabout
      vim.keymap.set("i", "<A-x>", "<Plug>(TaboutMulti)")
      vim.keymap.set("i", "<A-z>", "<Plug>(TaboutBackMulti)")
      return {
        { "<leader>u<tab>", "<cmd>TaboutToggle<cr>", desc = "Tabout toggle" },
      }
    end,
    opts = {
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
    },
  },
}
