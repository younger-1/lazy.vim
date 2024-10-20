return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next change" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Prev change" })

        map("n", "]C", function()
          gitsigns.nav_hunk("first")
        end, { desc = "Last change" })

        map("n", "[C", function()
          gitsigns.nav_hunk("last")
        end, { desc = "First change" })

        map("n", "]d", function()
          gitsigns.nav_hunk("next", { greedy = false, preview = true })
        end, { desc = "Next diff" })

        map("n", "[d", function()
          gitsigns.nav_hunk("prev", { greedy = false, preview = true })
        end, { desc = "Prev diff" })

        map("n", "]s", function()
          gitsigns.nav_hunk("next", { target = "staged", greedy = false, preview = true })
        end, { desc = "Next staged" })

        map("n", "[s", function()
          gitsigns.nav_hunk("prev", { target = "staged", greedy = false, preview = true })
        end, { desc = "Prev staged" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<cr>")

        -- Common hunk task
        map({ "n", "x" }, "<leader>hs", ":Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
        map({ "n", "x" }, "<leader>hr", ":Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
        map({ "n", "x" }, "<leader>hu", ":Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
        map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
        map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })
        map("n", "<leader>hU", "<cmd>Gitsigns reset_buffer_index<cr>", { desc = "Reset buffer index" })

        map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "Preview hunk inline" })
        map("n", "<leader>hP", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
        map("n", "<leader>hb", "<cmd>Gitsigns blame<cr>", { desc = "Blame" })
        map("n", "<leader>hl", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
        map("n", "<leader>hL", "<cmd>Gitsigns blame_line full=1<cr>", { desc = "Blame line(full)" })

        map("n", '<leader>h"', "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Line blame" })
        map("n", "<leader>h'", "<cmd>Gitsigns toggle_linehl<cr>", { desc = "Line highlight" })
        map("n", "<leader>h;", "<cmd>Gitsigns toggle_deleted<cr>", { desc = "Deleted lines" })
        map("n", "<leader>h,", "<cmd>Gitsigns toggle_numhl<cr>", { desc = "Number highlight" })
        map("n", "<leader>h.", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Sign highlight" })
        map("n", "<leader>h/", "<cmd>Gitsigns toggle_word_diff<cr>", { desc = "Word diff" })

        map("n", "<leader>hc", function()
          if vim.v.count == 0 then
            vim.cmd("Gitsigns change_base")
          else
            vim.cmd("Gitsigns change_base ~" .. vim.v.count)
          end
        end, { desc = "Change base" })
        map("n", "<leader>hC", "<cmd>Gitsigns reset_base<cr>", { desc = "Reset base" })

        map("n", "<leader>hd", function()
          if vim.v.count == 0 then
            vim.cmd("Gitsigns diffthis")
          else
            vim.cmd("Gitsigns diffthis ~" .. vim.v.count)
          end
        end, { desc = "Diff index" })
        map("n", "<leader>hD", "<cmd>Gitsigns diffthis<cr>", { desc = "Diff this" })

        map("n", "<leader>h<C-q>a", "<cmd>Gitsigns setqflist all<cr>", { desc = "All" })
        map("n", "<leader>h<C-q>b", "<cmd>Gitsigns setqflist attached<cr>", { desc = "Buffers opened" })
        map("n", "<leader>h<C-q>c", "<cmd>Gitsigns setqflist all<cr>", { desc = "Current buffer" })
        map("n", "<leader>h<C-z>a", "<cmd>Gitsigns setloclist all<cr>", { desc = "All" })
        map("n", "<leader>h<C-z>b", "<cmd>Gitsigns setloclist attached<cr>", { desc = "Buffers opened" })
        map("n", "<leader>h<C-z>c", "<cmd>Gitsigns setloclist all<cr>", { desc = "Current buffer" })

        if LazyVim.has("which-key.nvim") then
          require("which-key").add({
            {
              mode = "n",
              buffer = bufnr,
              { "<leader>h<C-q>", group = "+quickfix" },
              { "<leader>h<C-z>", group = "+loclist" },
            },
          })
        end
      end,
    },
  },
}
