return {
  {
    "SuperBo/fugit2.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    keys = {
      { "<leader>g<cr>", "<cmd>Fugit2<cr>" },
    },
    opts = {
      -- width = 100,
      -- external_diffview = true, -- use diffview.nvim instead of builtin implementation.
    },
  },
}
