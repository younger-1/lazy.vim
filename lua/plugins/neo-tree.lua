return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      bind_to_cwd = false,
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
      },
      buffers = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      {
        "<leader>ee",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s left"):format(U.root()))
        end,
        desc = "File tree",
      },
      -- float window
      {
        "<leader>fe",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s float"):format(U.root()))
          -- require("neo-tree.command").execute({
          --   toggle = true,
          --   reveal = true,
          --   dir = LazyVim.root(),
          --   position = "float",
          -- })
        end,
        desc = "File tree",
      },
      {
        "<leader>be",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s float buffers"):format(U.root()))
          -- require("neo-tree.command").execute({
          --   toggle = true,
          --   reveal = true,
          --   dir = LazyVim.root(),
          --   position = "float",
          --   source = "buffers",
          -- })
        end,
        desc = "Buf tree",
      },
      {
        "<leader>ge",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s float git_status"):format(U.root()))
        end,
        desc = "Git tree",
      },
      -- current window
      {
        "<leader>ef",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s current"):format(U.root()))
        end,
        desc = "File tree",
      },
      {
        "<leader>eb",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s current buffers"):format(U.root()))
        end,
        desc = "Buf tree",
      },
      {
        "<leader>eg",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s current git_status"):format(U.root()))
        end,
        desc = "Git tree",
      },
      --
      {
        "<leader>ek",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s top"):format(U.root()))
        end,
        desc = "File tree top",
      },
      {
        "<leader>ej",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s bottom"):format(U.root()))
        end,
        desc = "File tree bottom",
      },
      {
        "<leader>eh",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s left"):format(U.root()))
        end,
        desc = "File tree left",
      },
      {
        "<leader>el",
        function()
          vim.cmd(("Neotree toggle reveal dir=%s right"):format(U.root()))
        end,
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
