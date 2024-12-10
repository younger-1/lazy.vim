return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>ee",
        "<cmd>Neotree toggle reveal_force_cwd left<cr>",
        desc = "File tree",
      },
      -- float window
      {
        "<leader>fe",
        "<cmd>Neotree toggle reveal_force_cwd float<cr>",
        desc = "File tree",
      },
      {
        "<leader>be",
        "<cmd>Neotree toggle reveal_force_cwd float buffers<cr>",
        desc = "Buf tree",
      },
      {
        "<leader>ge",
        "<cmd>Neotree toggle reveal_force_cwd float git_status<cr>",
        desc = "Git tree",
      },
      -- current window
      {
        "<leader>ef",
        "<cmd>Neotree toggle reveal_force_cwd current<cr>",
        desc = "File tree",
      },
      {
        "<leader>eb",
        "<cmd>Neotree toggle reveal_force_cwd current buffers<cr>",
        desc = "Buf tree",
      },
      {
        "<leader>eg",
        "<cmd>Neotree toggle reveal_force_cwd current git_status<cr>",
        desc = "Git tree",
      },
      --
      {
        "<leader>ek",
        "<cmd>Neotree toggle reveal_force_cwd top<cr>",
        desc = "File tree top",
      },
      {
        "<leader>ej",
        "<cmd>Neotree toggle reveal_force_cwd bottom<cr>",
        desc = "File tree bottom",
      },
      {
        "<leader>eh",
        "<cmd>Neotree toggle reveal_force_cwd left<cr>",
        desc = "File tree left",
      },
      {
        "<leader>el",
        "<cmd>Neotree toggle reveal_force_cwd right<cr>",
        desc = "File tree right",
      },
    },
  },
  {
    "nvzone/menu",
    optional = true,
    opts = {
      special = {
        ["neo-tree"] = {
          {
            name = "  New file",
            cmd = function()
              local source = vim.api.nvim_buf_get_var(0, "neo_tree_source")
              local winid = vim.api.nvim_get_current_win()
              local state = require("neo-tree.sources.manager").get_state_for_window(winid)
              require(("neo-tree.sources.%s.commands"):format(source)).add(state)
            end,
            rtxt = "a",
          },
        },
      },
    },
  },
}
