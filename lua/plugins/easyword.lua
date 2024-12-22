return {
  {
    "vanaigr/easyword.nvim",
    keys = { "s", "x" },
    config = function()
      local easyword = require("easyword")

      vim.keymap.set("n", "s", function()
        easyword.jump({ recover_key = "s" })
      end)
      vim.keymap.set("x", "x", function()
        easyword.jump({ recover_key = "x" })
      end)
      vim.keymap.set("o", "x", function()
        easyword.jump()
      end)

      easyword.apply_default_highlight()

      local group = vim.api.nvim_create_augroup("EasywordHighlighting", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          easyword.apply_default_highlight()
        end,
        pattern = "*",
        group = group,
      })
    end,
  },
}
