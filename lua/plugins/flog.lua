return {
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gtabedit",
    },
    keys = {
      { "<leader>g<tab>", "<cmd>tab Git<cr>" },
      { "<leader>g<space>b", "<cmd>Git blame<cr>", desc = "Blame" },
      { "<leader>g<space>d", "<cmd>Git difftool<cr>", desc = "Diff to quicklist" },
      { "<leader>g<space>D", "<cmd>Git difftool -y<cr>", desc = "Diff to tab" },
      { "<leader>g<space>m", "<cmd>Git mergetool<cr>", desc = "Merge" },
      { "<leader>g<space>q", "<cmd>Ggrep -q<cr>", desc = "Grep" },
      -- { "<leader>g<space>c", "<cmd>Gclog<cr>", desc = "Commit history" },
      -- { "<leader>g<space>h", "<cmd>0Gclog<cr>", desc = "File history" },
      { "<leader>g<space>c", "<cmd>Git log --oneline<cr>", desc = "Commit history" },
      { "<leader>g<space>-", "<cmd>Glcd<cr>", desc = "Change dir (lcd)" },
    },
  },
  {
    "rbong/vim-flog",
    dependencies = { "tpope/vim-fugitive" },
    cmd = { "Flog", "Flogsplit" },
    keys = {
      { "<leader>gm", "<cmd>Flog<cr>" },
      { "<leader>gM", "<cmd>Flogsplit<cr>" },
    },
  },
}
