return {
  {
    "FabijanZulj/blame.nvim",
    event = "LazyFile",
    keys = {
      { "<leader>g,", "<cmd>BlameToggle window<cr>" },
      { "<leader>g.", "<cmd>BlameToggle virtual<cr>" },
    },
    opts = {
      blame_options = { "-w" },
    },
  },
}
