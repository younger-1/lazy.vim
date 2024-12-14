return {
  {
    -- "roobert/activate.nvim",
    "younger-1/activate.nvim",
    branch = "young/feat/use-stdpath",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>la",
        '<CMD>lua require("activate").list_plugins()<CR>',
        desc = "Plugins",
      },
    },
  },
}
