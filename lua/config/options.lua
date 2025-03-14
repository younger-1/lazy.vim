-- Options are automatically loaded before lazy.nvim startup
-- Default options:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/options.lua

vim.g.maplocalleader = ","
-- vim.g.autoformat = false
vim.g.root_spec = { "lsp", { ".git" }, "cwd" }
vim.g.trouble_lualine = false
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_cmp = "nvim-cmp"

local o = vim.opt

o.clipboard = ""

o.mouse = "nvi"

o.confirm = true -- show confirm dialog instead of error msg

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

o.list = true
o.listchars = {
  tab = "│",
  -- eol = "↲",
  -- space = "•",
  trail = "■",
  extends = "»",
  precedes = "«",
  nbsp = "⦸",
}

o.diffopt:append({
  "vertical",
  "internal",
  "filler",
  "closeoff",
  "indent-heuristic", -- make vimdiff more closely match git diff
  "algorithm:histogram",
  "linematch:60", -- nvim-0.9
})

o.fillchars:append({
  msgsep = "─",
})

o.showtabline = 2
o.laststatus = 3

o.shortmess:append({
  I = false, -- show :intro at startup
})
