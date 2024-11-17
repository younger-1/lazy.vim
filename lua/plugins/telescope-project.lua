return {
  "nvim-telescope/telescope-project.nvim",
  keys = {
    { "<leader>sp", "<cmd>Telescope project display_type=full layout_config={width=0.7}<cr>", desc = "Projects" },
  },
  specs = {
    {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions = {
          project = {
            theme = "dropdown",
            base_dirs = { -- check .git dir for project
              -- { vim.fn.stdpath 'data' .. '/lazy' }, -- Too slow
              -- { '~/work' },
              -- { '~/source' },
              -- { '~/projects' },
              { "~", max_depth = 3 },
            },
            hidden_files = true,
            search_by = { "title", "path" },
            -- on_project_selected = function(prompt_bufnr)
            --   -- Do anything you want in here. For example:
            --   local project_actions = require 'telescope._extensions.project.actions'
            --   project_actions.change_working_directory(prompt_bufnr, false)
            --   require('harpoon.ui').nav_file(1)
            -- end,
            -- mappings = {
            --   i = {
            --     ["<C-d>"] = project_actions.delete_project,
            --     ["<C-v>"] = project_actions.rename_project,
            --     ["<C-a>"] = project_actions.add_project,
            --     ["<C-A>"] = project_actions.add_project_cwd,
            --     ["<C-f>"] = project_actions.find_project_files,
            --     ["<C-b>"] = project_actions.browse_project_files,
            --     ["<C-s>"] = project_actions.search_in_project_files,
            --     ["<C-r>"] = project_actions.recent_project_files,
            --     ["<C-l>"] = project_actions.change_working_directory,
            --     ["<C-o>"] = project_actions.next_cd_scope,
            --     ["<C-w>"] = project_actions.change_workspace,
            --   },
            -- },
          },
        },
      },
    },
  },
  config = function()
    require("telescope").load_extension("project")
  end,
}
