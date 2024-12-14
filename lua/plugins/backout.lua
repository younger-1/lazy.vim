return {
  {
    "AgusDOLARD/backout.nvim",
    keys = {
      { "<Tab>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
      { "<S-Tab>", "<cmd>lua require('backout').out()<cr>", mode = { "i" } },
    },
    opts = {},
  },
}
