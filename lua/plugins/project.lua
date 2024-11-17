return {
  { import = "lazyvim.plugins.extras.util.project" },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
    keys = {
      {
        "<leader>fP",
        function()
          local s = require("project_nvim.utils.history").session_projects
          local r = LazyVim.root.get()
          table.insert(s, r)
          -- display info
          LazyVim.info({ "Path added:\n", vim.fn.fnamemodify(r, ":~") }, { title = "Project" })
        end,
        desc = "Projects",
      },
    },
  },
}
