return {
  -- spellcheck dictionary for programmers
  {
    "psliwka/vim-dirtytalk",
    build = ":DirtytalkUpdate",
    config = function()
      vim.opt.spelllang:append({ "en", "programming" })
    end,
  },
}
