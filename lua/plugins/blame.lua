return {
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<leader>g,", "<cmd>BlameToggle window<cr>" },
      { "<leader>g.", "<cmd>BlameToggle virtual<cr>" },
    },
    opts = {
      blame_options = {
        "-w", -- Ignore whitespace when comparing the parent’s version and the child’s to find where the lines came from.
      },
    },
  },
}
