---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = require("plugins.telescope.opts"),
    keys = require("plugins.telescope.keys"),
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
      },
      {
        "natecraddock/telescope-zf-native.nvim",
        cond = false,
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
    "tsakirist/telescope-lazy.nvim",
    keys = {
      {
        "<leader>sx",
        "<cmd>Telescope lazy<cr>",
        desc = "Lazy plugins",
      },
    },
    specs = {
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
    config = function()
      require("telescope").load_extension("lazy")
    end,
  },
  {
    "LinArcX/telescope-env.nvim",
    keys = {
      { "<leader>se", "<cmd>Telescope env<cr>", desc = "Env variables" },
    },
    config = function()
      require("telescope").load_extension("env")
    end,
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
    keys = {
      {
        "<leader>sss",
        function()
          vim.cmd("Telescope symbols")
        end,
        desc = "Symbols",
      },
      {
        "<leader>sse",
        function()
          require("telescope.builtin").symbols({ sources = { "emoji" } })
        end,
        desc = "Emoji",
      },
      {
        "<leader>ssg",
        function()
          require("telescope.builtin").symbols({ sources = { "gitmoji" } })
        end,
        desc = "Git",
      },
      {
        "<leader>ssj",
        function()
          require("telescope.builtin").symbols({ sources = { "julia" } })
        end,
        desc = "Julia",
      },
      {
        "<leader>ssk",
        function()
          require("telescope.builtin").symbols({ sources = { "kaomoji" } })
        end,
        desc = "Kaomoji",
      },
      {
        "<leader>ssl",
        function()
          require("telescope.builtin").symbols({ sources = { "latex" } })
        end,
        desc = "LaTeX",
      },
      {
        "<leader>ssm",
        function()
          require("telescope.builtin").symbols({ sources = { "math" } })
        end,
        desc = "Math",
      },
      {
        "<leader>ssn",
        function()
          require("telescope.builtin").symbols({ sources = { "nerd" } })
        end,
        desc = "Nerd",
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
