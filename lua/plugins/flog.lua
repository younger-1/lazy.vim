return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gblame", "Gpush", "Gpull", "Gdiff" },
    keys = {
      { "<leader>g ", "<cmd>Git<cr>" },
      { "<leader>g<tab>", "<cmd>tab Git<cr>" },
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
