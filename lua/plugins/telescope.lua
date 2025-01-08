---@type LazySpec
return {
  {
    "younger-1/telescope.nvim",
    branch = "young/feat/insert-original-file",
    opts = require("plugins.telescope.opts"),
    keys = require("plugins.telescope.keys"),
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
      },
      {
        "natecraddock/telescope-zf-native.nvim",
        enabled = false,
        submodules = false,
        specs = {
          "nvim-telescope/telescope.nvim",
          opts = {
            extensions = {
              ["zf-native"] = {
                -- options for sorting file-like items
                file = {
                  -- override default telescope file sorter
                  enable = true,
                  -- highlight matching text in results
                  highlight_results = true,
                  -- enable zf filename match priority
                  match_filename = true,
                },
                -- options for sorting all other items
                generic = {
                  -- override default telescope generic item sorter
                  enable = false,
                  -- highlight matching text in results
                  highlight_results = true,
                  -- disable zf filename match priority
                  match_filename = false,
                },
              },
            },
          },
        },
        init = function()
          -- To enable extension's setting
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("zf-native")
          end)
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        dependencies = {
          { "kkharji/sqlite.lua" },
        },
        specs = {
          "nvim-telescope/telescope.nvim",
          opts = {
            defaults = {
              history = {
                path = vim.fs.joinpath(vim.fn.stdpath("data"), "telescope_history.sqlite3"),
                limit = 500,
              },
            },
          },
        },
        init = function()
          -- To enable extension's setting
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension("smart_history")
          end)
        end,
      },
    },
  },
  {
    "catgoose/telescope-helpgrep.nvim",
    keys = {
      { "<leader>s?", "<cmd>Telescope helpgrep<cr>", desc = "Help grep" },
    },
  },
}
