-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/autocmds.lua

local function augroup(name)
  return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = false
  end,
})
