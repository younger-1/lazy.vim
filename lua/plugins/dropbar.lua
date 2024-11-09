return {
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    keys = {
      {
        "<leader>cj",
        function()
          if vim.v.count == 0 then
            require("dropbar.api").pick()
          else
            require("dropbar.api").pick(vim.v.count)
          end
        end,
        desc = "Dropbar pick",
      },
    },
    config = function()
      -- Dropbar can be used as a drop-in replacement for Neovim's builtin vim.ui.select menu.
      -- vim.ui.select = require("dropbar.utils.menu").select

      require("dropbar").setup({
        sources = {
          path = {
            relative_to = function(buf, win)
              local pwd_root = vim.fs.root(vim.env.PWD, { ".git" })
              local buf_root = vim.fs.root(buf, { ".git" })
              if pwd_root == buf_root then
                return pwd_root or vim.env.PWD
              else
                return buf_root and vim.fs.dirname(buf_root) or vim.env.PWD
              end
            end,
          },
        },
      })
    end,
  },
}
