return {
  {
    "andymass/vim-matchup",
    vscode = true,
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<tab>", "%", remap = true, mode = { "n", "x", "o" } },
      { "<S-tab>", "g%", remap = true, mode = { "n", "x", "o" } },
      -- { "<C-y>", "<cmd>MatchupWhereAmI?<cr>", mode = { "n", "i" } },
      {
        "<C-y>",
        function()
          vim.cmd("silent! NoiceDisable")
          vim.cmd("MatchupWhereAmI?")
          vim.schedule(function()
            vim.cmd("silent! NoiceEnable")
          end)
        end,
        mode = { "n", "i" },
      },
    },
    init = function()
      -- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
      vim.g.loaded_matchit = 1
      vim.g.loaded_matchparen = 1

      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
      vim.g.matchup_matchparen_offscreen = {
        -- method = "popup",
        -- fullwidth = 1,
        -- syntax_hl = 1,
        -- highlight = "Normal",
      }
      vim.g.matchup_matchparen_nomode = "i"
      vim.g.matchup_matchparen_stopline = 400 * 2 -- for match highlighting only
      vim.g.matchup_delim_stopline = 1500 * 4 -- generally
      vim.o.maxmempattern = 1000 * 2
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
