return {
  {
    "nvim-telescope/telescope-frecency.nvim",
    keys = {
      { "<leader>fh", "<cmd>Telescope frecency default_text=:CWD:<cr>", desc = "Frecency" },
      { "<leader>fH", "<cmd>Telescope frecency<cr>", desc = "Frecency (all)" },
    },
    specs = {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions = {
          frecency = {
            show_scores = true,
            show_unindexed = true,
            show_filter_column = false,
            workspaces = {
              -- [](https://github.com/nvim-telescope/telescope-frecency.nvim/issues/21)
              ["conf"] = vim.fn.expand("~/.config"),
              ["share"] = vim.fn.expand("~/.local/share"),
              ["dot"] = vim.fn.expand("~/dotter"),
              ["beauty"] = vim.fn.expand("~/Beauty"),
              ["project"] = vim.fn.expand("~/projects"),
              ["source"] = vim.fn.expand("~/source"),
              ["wiki"] = vim.fn.expand("~/wiki"),
            },
          },
        },
      },
    },
    init = function()
      -- To record most recent files opened by telescope
      LazyVim.on_load("telescope.nvim", function()
        require("lazy").load({ plugins = { "telescope-frecency.nvim" } })
      end)
    end,
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
}
