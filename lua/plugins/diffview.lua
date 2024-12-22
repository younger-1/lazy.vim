return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdd", "<cmd>DiffviewOpen<cr>" },
      { "<leader>gdh", ":DiffviewFileHistory<cr>", mode = { "n", "x" } },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>" },
      { "<leader>gdp", "<cmd>DiffviewLog<cr>" },
      { "<leader>gds", "<cmd>DiffviewFileHistory -g --range=stash<cr>", desc = "Stash" },
    },
    opts = function(_, opts)
      local actions = require("diffview.actions")
      return vim.tbl_deep_extend("force", opts, {
        enhanced_diff_hl = true,
        view = {
          default = {
            winbar_info = true,
          },
          file_history = {
            winbar_info = true,
          },
        },
        keymaps = {
          view = {
            ["q"] = actions.close,
          },
          file_panel = {
            ["q"] = actions.close,
          },
          file_history_panel = {
            ["q"] = actions.close,
            ["e"] = function()
              local content = U.get_line_content()
              local words = U.make_words_from_string(content)
              local commit = words[4]

              local lib = require("diffview.lib")
              local view = lib.get_current_view() ---@cast view DiffView|FileHistoryView
              local file = view:infer_cur_file()
              if file then
                vim.cmd(":Gtabedit " .. commit .. ":" .. file.path)
                -- vim.print(commit)
              end
            end,
          },
        },
      })
    end,
  },
}
