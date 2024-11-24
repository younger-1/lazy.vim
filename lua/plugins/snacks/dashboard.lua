return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader><bs>",
        function()
          Snacks.dashboard.open()
        end,
        "Dashboard",
      },
    },
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        sections = {
          {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
            -- {
            --   section = "terminal",
            --   cmd = "onefetch --no-art",
            --   height = 25,
            --   width = 60,
            --   padding = 1,
            -- },
          },
          {
            {
              pane = 2,
              title = "Keep Calm",
              padding = 1,
              align = "center",
            },
            {
              pane = 2,
              icon = " ",
              title = "MRU",
              section = "recent_files",
              padding = 1,
            },
            {
              pane = 2,
              icon = " ",
              title = "Projects",
              section = "projects",
              padding = 1,
            },
            ---
            {
              pane = 2,
              -- title = "[CWD] ",
              file = vim.fn.fnamemodify(".", ":~"),
              padding = 1,
              align = "center",
            },
            {
              pane = 2,
              icon = " ",
              title = "MRU (cwd)",
              section = "recent_files",
              cwd = true,
              padding = 1,
            },
            -- {
            --   pane = 2,
            --   padding = 1,
            -- },
            {
              pane = 2,
              icon = " ",
              title = "Git Status",
              section = "terminal",
              -- enabled = Snacks.git.get_root() ~= nil,
              enabled = vim.fs.root(0, ".git") ~= nil,
              -- cmd = "hub status --short --branch --renames",
              cmd = "git ss",
              height = 5,
              padding = 1,
              ttl = 5 * 60,
            },
          },
        },
      },
    },
  },
}
