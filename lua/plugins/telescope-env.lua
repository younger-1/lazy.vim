return {
  {
    "LinArcX/telescope-env.nvim",
    keys = {
      { "<leader>se", "<cmd>Telescope env<cr>", desc = "Env variables" },
    },
    config = function()
      require("telescope").load_extension("env")
    end,
  },
}
