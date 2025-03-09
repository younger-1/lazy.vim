return {
  "folke/snacks.nvim",
  keys = {
    {
      "<A-c>",
      function()
        Snacks.bufdelete()
      end,
      desc = "Close buffer",
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
          border = "single",
        })
      end,
    },
    {
      "<leader>ft",
      function()
        Snacks.terminal(nil, {
          cwd = U.root(),
          win = {
            position = "float",
            border = "rounded",
          },
        })
      end,
      desc = "Terminal (Root Dir)",
    },
  },
  ---@type snacks.Config
  opts = {
    styles = {
      notification = {
        wo = { wrap = true }, -- wrap long notifications
      },
      float = {
        border = "none",
      },
    },
    --
    statuscolumn = {
      folds = {
        open = true, -- show open fold icons
        git_hl = true, -- use gitsigns hl for fold icons
      },
    },
    bigfile = {
      size = 0.5 * 1024 * 1024, -- 0.5MB
    },
    indent = {
      chunk = {
        enabled = true,
      },
    },
    terminal = {
      win = {
        position = "bottom",
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        -- vim.print = _G.dd -- Override print to use snacks for `:=` command
      end,
    })
  end,
}
