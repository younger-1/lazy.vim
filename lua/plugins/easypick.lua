return {
  {
    "axkirillov/easypick.nvim",
    cmd = "Easypick",
    keys = {
      {
        "<leader>sE",
        function()
          vim.ui.input({ prompt = "Easypick: " }, function(cmd)
            if cmd then
              require("easypick").one_off(cmd)
            end
          end)
        end,
        "Easypick one-off",
      },
    },
    config = function()
      local easypick = require("easypick")

      -- local get_default_branch = "git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
      -- local base_branch = vim.fn.system(get_default_branch) or "main"
      local base_branch = "main"

      easypick.setup({
        -- add your custom pickers here
        pickers = {
          -- list files inside current folder with default previewer
          {
            -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
            name = "ls",
            -- the command to execute, output has to be a list of plain text entries
            command = "ls",
            -- specify your custom previwer, or use one of the easypick.previewers
            previewer = easypick.previewers.default(),
          },

          -- diff current branch with base_branch and show files that changed with respective diffs in preview
          {
            name = "changed_files",
            command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
            previewer = easypick.previewers.branch_diff({ base_branch = base_branch }),
          },

          -- list files that have conflicts with diffs in preview
          {
            name = "conflicts",
            command = "git diff --name-only --diff-filter=U --relative",
            previewer = easypick.previewers.file_diff(),
          },

          -- list of commands that you want to pick from
          {
            name = "command_palette_demo",
            command = "cat " .. [[
<< EOF
:Lazy log
:Telescope find_files
:Git blame
EOF
]],
            -- pass a pre-configured action that runs the command
            action = easypick.actions.nvim_commandf("%s"),
            -- you can specify any theme you want, but the dropdown looks good for this example =)
            opts = require("telescope.themes").get_dropdown({}),
          },
        },
      })
    end,
  },
}
