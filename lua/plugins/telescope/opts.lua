return function(_, opts)
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

          ["<CR>"] = {
            -- @see https://github.com/nvim-telescope/telescope.nvim/issues/1048#issuecomment-2177826003
            function(prompt_bufnr)
              local action_state = require("telescope.actions.state")
              local picker = action_state.get_current_picker(prompt_bufnr)
              local multi = picker:get_multi_selection()

              if vim.tbl_isempty(multi) then
                actions.select_default(prompt_bufnr) -- the normal enter behaviour
                return
              end

              actions.close(prompt_bufnr)
              for _, entry in pairs(multi) do
                local file = entry.path or entry.filename or entry.value
                if file then
                  U.open_file(file, entry.lnum, entry.col)
                end
              end
            end,
            type = "action",
            opts = { desc = "xy_select_multi" },
          },
        },
      },
    },
  })
end
