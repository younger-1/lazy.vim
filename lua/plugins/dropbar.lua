return {
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
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
      vim.ui.select = require("dropbar.utils.menu").select
    end,
  },
}
