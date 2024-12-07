-- vim's `w`/`b` will move to
-- spider's `w`/`b` will move to
--
-- local myVariableName = FOO_BAR_BAZ
-- ^     ^              ^ ^
-- local myVariableName = FOO_BAR_BAZ
-- ^     ^ ^       ^    ^ ^   ^   ^
--
-- <a href="http://www.vim.org/">www.vim.org</a>
-- ^^ ^   ^ ^   ^  ^  ^^  ^^  ^  ^  ^^  ^^  ^ ^
-- <a href="http://www.vim.org/">www.vim.org</a>
--  ^ ^     ^      ^   ^   ^     ^   ^   ^    ^
--
-- CamelCaseACRONYMWords_underscore1234
-- w--------------------------------->w
-- e--------------------------------->e
-- b<---------------------------------b
-- CamelCaseACRONYMWords_underscore1234
-- w--->w-->w----->w---->w-------->w->w
-- e-->e-->e----->e--->e--------->e-->e
-- b<---b<--b<-----b<----b<--------b<-b

return {
  -- NOTE: only move by subwords
  -- {
  --   "chaoren/vim-wordmotion",
  --   event = { "BufReadPost", "BufNewFile" },
  --   init = function()
  --     vim.g.wordmotion_prefix = ","
  --     -- disable cmdline short word
  --     vim.g.wordmotion_mappings = { ["<C-R><C-W>"] = "" }
  --   end,
  -- },
  -- NOTE: only skip insignificant punctuation
  -- {
  --   "anuvyklack/vim-smartword",
  --   event = { "BufReadPost", "BufNewFile" },
  -- },
  -- NOTE: This plugin ignores vim's iskeyword option.
  {
    "chrisgrieser/nvim-spider",
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-w",
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-e",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-b",
      },
      {
        "ge",
        "<cmd>lua require('spider').motion('ge')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-ge",
      },
    },
  },
}
