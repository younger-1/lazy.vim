-- Options are automatically loaded before lazy.nvim startup
-- Default options:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/options.lua

vim.g.maplocalleader = ","
-- vim.g.autoformat = false

local o = vim.opt

o.clipboard = ""

o.mouse = "nvi"

o.autoindent = true
o.smartindent = true

o.expandtab = true
o.tabstop = 4
o.softtabstop = 0
o.shiftwidth = 0
o.smarttab = true

o.wrap = false
o.linebreak = true

o.breakindent = true
-- o.breakindentopt = { "sbr" }
o.showbreak = "↪ "
