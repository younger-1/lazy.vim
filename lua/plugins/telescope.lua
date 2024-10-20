return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      return opts
    end,
    keys = {
      {
        "<leader>s<space>",
        "<cmd>Telescope resume<cr>",
      },
      {
        "<leader>su",
        "<cmd>Telescope pickers<cr>",
      },
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
    dependencies = {
      {
        "natecraddock/telescope-zf-native.nvim",
        submodules = false,
        -- Not use LazyVim.opts("telescope.nvim"), which trigger require telescope in opts function
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
                  enable = true,
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
        dependencies = { "kkharji/sqlite.lua" },
        -- Not use LazyVim.opts("telescope.nvim"), which trigger require telescope in opts function
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
}
