return {
  {
    "roobert/activate.nvim",
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
