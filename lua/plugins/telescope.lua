return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>yc",
        LazyVim.pick("files", { cwd = vim.fn.stdpath("config") }),
        desc = "Find Config File",
      },
      {
        "<leader>yC",
        LazyVim.pick("live_grep", { cwd = vim.fn.stdpath("config") }),
        desc = "Search Config File",
      },
      {
        "<leader>yl",
        LazyVim.pick("files", { cwd = LazyVim.get_plugin_path("LazyVim") }),
        desc = "Find LazyVim File",
      },
      {
        "<leader>yL",
        LazyVim.pick("live_grep", { cwd = LazyVim.get_plugin_path("LazyVim") }),
        desc = "Search LazyVim File",
      },
      {
        "<leader>ya",
        LazyVim.pick("files", { cwd = require("lazy.core.config").options.root }),
        desc = "Find plugin File",
      },
      {
        "<leader>yA",
        LazyVim.pick("live_grep", { cwd = require("lazy.core.config").options.root }),
        desc = "Search plugin File",
      },
    },
  },
}
