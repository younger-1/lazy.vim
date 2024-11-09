return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinLeave" },
  config = function()
    require("colorful-winsep").setup({
      no_exec_files = {
        "neo-tree",
        "Outline",
      },
    })
  end,
}
