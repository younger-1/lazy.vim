return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          cache_picker = {
            num_pickers = 20,
          },
          dynamic_preview_title = true,
          path_display = {
            filename_first = { reverse_directories = false },
          },
          mappings = {
            i = {
              ["<C-_>"] = {
                require("telescope.actions.generate").which_key({
                  keybind_width = 10,
                  separator = " ",
                  close_with_action = false,
                }),
                type = "action", -- 'action_key', 'command'
                opts = { desc = "which_key" }, -- 'which_key', 'nop'
              },

              --  NOTE: disabled key
              -- ['<C-n>'] = false,
              -- ['<C-p>'] = false,
              ["<C-f>"] = false,
              ["<C-b>"] = false,
              ["<A-f>"] = false,
              ["<A-b>"] = false,

              ["<C-v>"] = { actions.select_vertical, type = "action", opts = { desc = "nop" } },
              ["<C-s>"] = { actions.select_horizontal, type = "action", opts = { desc = "nop" } },

              ["<C-j>"] = { actions.move_selection_next, type = "action", opts = { desc = "nop" } },
              ["<C-k>"] = { actions.move_selection_previous, type = "action", opts = { desc = "nop" } },

              ["<A-n>"] = { actions.cycle_history_next, type = "action", opts = { desc = "nop" } },
              ["<A-p>"] = { actions.cycle_history_prev, type = "action", opts = { desc = "nop" } },

              ["<A-j>"] = { actions.results_scrolling_down, type = "action", opts = { desc = "nop" } },
              ["<A-k>"] = { actions.results_scrolling_up, type = "action", opts = { desc = "nop" } },
              ["<A-h>"] = { actions.results_scrolling_left, type = "action", opts = { desc = "nop" } },
              ["<A-l>"] = { actions.results_scrolling_right, type = "action", opts = { desc = "nop" } },

              ["<A-S-j>"] = { actions.preview_scrolling_down, type = "action", opts = { desc = "nop" } },
              ["<A-S-k>"] = { actions.preview_scrolling_up, type = "action", opts = { desc = "nop" } },
              ["<A-S-h>"] = { actions.preview_scrolling_left, type = "action", opts = { desc = "nop" } },
              ["<A-S-l>"] = { actions.preview_scrolling_right, type = "action", opts = { desc = "nop" } },

              ["<S-down>"] = { actions.results_scrolling_down, type = "action", opts = { desc = "nop" } },
              ["<S-up>"] = { actions.results_scrolling_up, type = "action", opts = { desc = "nop" } },
              ["<S-left>"] = { actions.results_scrolling_left, type = "action", opts = { desc = "nop" } },
              ["<S-right>"] = { actions.results_scrolling_right, type = "action", opts = { desc = "nop" } },

              ["<A-down>"] = { actions.preview_scrolling_down, type = "action", opts = { desc = "nop" } },
              ["<A-up>"] = { actions.preview_scrolling_up, type = "action", opts = { desc = "nop" } },
              ["<A-left>"] = { actions.preview_scrolling_left, type = "action", opts = { desc = "nop" } },
              ["<A-right>"] = { actions.preview_scrolling_right, type = "action", opts = { desc = "nop" } },

              ["<A-a>"] = actions.toggle_all,
              ["<A-d>"] = actions.drop_all,

              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-z>"] = actions.smart_send_to_loclist + actions.open_loclist,

              ["<A-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
              ["<A-z>"] = actions.smart_add_to_loclist + actions.open_loclist,
            },
          },
        },
      })
    end,

    keys = {
      { "<leader>s<space>", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>su", "<cmd>Telescope pickers<cr>", desc = "Pickers" },
      {
        mode = "x",
        "<leader>sg",
        function()
          local text = require("util").get_visual_selection()
          require("telescope.builtin").live_grep({})
          vim.fn.feedkeys(text)
        end,
        desc = "Grep",
      },
      {
        mode = "x",
        "<leader>sw",
        function()
          require("telescope.builtin").grep_string({
            search = require("util").get_visual_selection_by_reg(),
          })
        end,
        desc = "Word",
      },
      --
      { "<leader>fr", "<cmd>Telescope oldfiles only_cwd=true<cr>", desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent file" },
      {
        mode = "x",
        "<leader>ff",
        function()
          local text = require("util").get_visual_selection()
          require("telescope.builtin").find_files({})
          vim.fn.feedkeys(text)
        end,
        desc = "Find file",
      },
      --
      { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Status" },
      { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "Buffer commits" },
      { "<leader>gl", "<cmd>Telescope git_bcommits_range<cr>", desc = "Line commits" },
      {
        mode = "x",
        "<leader>gl",
        function()
          -- vim.fn.feedkeys(vim.keycode("<Esc>"))
          require("telescope.builtin").git_bcommits_range({
            from = vim.fn.line("'<"),
            to = vim.fn.line("'>"),
          })
        end,
        desc = "Line commits",
      },
      --
      {
        "<leader>yc",
        LazyVim.pick("files", { cwd = vim.fn.stdpath("config") }),
        desc = "Find config file",
      },
      {
        "<leader>yC",
        LazyVim.pick("live_grep", { cwd = vim.fn.stdpath("config") }),
        desc = "Search config file",
      },
      {
        mode = "x",
        "<leader>yC",
        function()
          local text = require("util").get_visual_selection()
          require("telescope.builtin").live_grep({
            cwd = vim.fn.stdpath("config"),
          })
          vim.fn.feedkeys(text)
        end,
        desc = "Search config file",
      },
      {
        "<leader>yl",
        LazyVim.pick("files", { cwd = LazyVim.get_plugin_path("LazyVim") }),
        desc = "Find LazyVim file",
      },
      {
        "<leader>yL",
        LazyVim.pick("live_grep", { cwd = LazyVim.get_plugin_path("LazyVim") }),
        desc = "Search LazyVim file",
      },
      {
        mode = "x",
        "<leader>yL",
        function()
          local text = require("util").get_visual_selection()
          require("telescope.builtin").live_grep({
            cwd = LazyVim.get_plugin_path("LazyVim"),
          })
          vim.fn.feedkeys(text)
        end,
        desc = "Search LazyVim file",
      },
      {
        "<leader>ya",
        LazyVim.pick("files", { cwd = require("lazy.core.config").options.root }),
        desc = "Find plugin file",
      },
      {
        "<leader>yA",
        LazyVim.pick("live_grep", { cwd = require("lazy.core.config").options.root }),
        desc = "Search plugin file",
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
        specs = {
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
        },
        specs = {
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
    specs = {
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
