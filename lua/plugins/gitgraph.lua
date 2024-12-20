return {
  {
    "isakbm/gitgraph.nvim",
    keys = {
      {
        "<leader>gr",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
    opts = {
      symbols = {
        merge_commit = "",
        commit = "",
        merge_commit_end = "",
        commit_end = "",
        -- Advanced symbols
        GVER = "",
        GHOR = "",
        GCLD = "",
        GCRD = "╭",
        GCLU = "",
        GCRU = "",
        GLRU = "",
        GLRD = "",
        GLUD = "",
        GRUD = "",
        GFORKU = "",
        GFORKD = "",
        GRUDCD = "",
        GRUDCU = "",
        GLUDCD = "",
        GLUDCU = "",
        GLRDCL = "",
        GLRDCR = "",
        GLRUCL = "",
        GLRUCR = "",
      },
      -- format = {
      --   timestamp = "%H:%M:%S %d-%m-%Y",
      --   fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      -- },
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          if LazyVim.has("diffview.nvim") then
            vim.notify("DiffviewOpen " .. commit.hash .. "^!")
            vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
          end
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          if LazyVim.has("diffview.nvim") then
            vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
            vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          end
        end,
      },
    },
  },
}
