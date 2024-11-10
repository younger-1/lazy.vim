return {
  {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<C-y>", "<cmd>MatchupWhereAmI?<cr>" },
    },
    init = function()
      vim.g.matchup_matchparen_offscreen = {
        -- method = "popup", -- disabled, as we have treesitter-context
      }

      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        enable_quotes = true, -- https://github.com/andymass/vim-matchup/issues/287
        disable_virtual_text = true, -- do not use virtual text to highlight the virtual end of a block, for languages without explicit end markers (e.g., Python).
        include_match_words = true, -- additionally include traditional vim regex matches for symbols. For example, highlights /* */ comments in C++ which are not supported in tree-sitter matching.
      },
    },
  },
}
