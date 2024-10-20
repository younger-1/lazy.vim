return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults.cache_picker = {
        num_pickers = 20,
      }
      return opts
    end,
    keys = {
      {
        "<leader>s<space>",
        "<cmd>Telescope resume<cr>",
        desc = "Resume",
      },
      {
        "<leader>su",
        "<cmd>Telescope pickers<cr>",
        desc = "Pickers",
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
        "nvim-telescope/telescope-fzf-native.nvim",
      },
      {
        "natecraddock/telescope-zf-native.nvim",
        cond = false,
        submodules = false,
        dependencies = {
          {
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
          {
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
    "tsakirist/telescope-lazy.nvim",
    keys = {
      {
        "<leader>sx",
        "<cmd>Telescope lazy<cr>",
        desc = "Lazy plugins",
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        opts = {
          extensions = {
            lazy = {
              theme = "ivy",
              show_icon = true,
              mappings = {
                open_in_browser = "<C-o>",
                open_in_find_files = "<C-f>",
                open_in_live_grep = "<C-g>",
                open_in_file_browser = "<C-b>",
                open_in_terminal = "<C-t>",
                open_plugins_picker = "<C-o>", -- Works only after having called first another action
                open_lazy_root_find_files = "<C-r>f",
                open_lazy_root_live_grep = "<C-r>g",
                change_cwd_to_plugin = "<C-r>d",
              },
            },
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("lazy")
    end,
  },
}
