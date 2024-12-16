return {
  {
    "AgusDOLARD/backout.nvim",
    keys = {
      { "<S-Tab>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
      { "<Tab>", "<cmd>lua require('backout').out()<cr>", mode = { "i" } },
    },
    opts = {},
  },
}
