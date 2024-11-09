-- Options are automatically loaded before lazy.nvim startup
-- Default options:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/options.lua

-- vim.g.autoformat = false
vim.g.lazyvim_statuscolumn = {
  folds_open = true, -- show fold sign when fold is open
  folds_githl = true, -- highlight fold sign with git sign color
}
local o = vim.opt

o.clipboard = ""
o.mouse = "nvi"
