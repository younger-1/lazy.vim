-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

map("x", "X", '"+x')
map("x", "Y", '"+y')
map("x", "d", '"_d')

map("i", "<C-v>", "<C-g>u<C-r><C-o>+")
map("c", "<C-v>", "<C-r>+")

map("", "<TAB>", "%", { remap = true })
map("", "<C-i>", "<C-i>")

map("n", "<BS>", "<C-^>")

map("!", "<C-a>", "<Home>")
map("!", "<C-e>", "<End>")
map("!", "<C-f>", "<Right>")
map("!", "<C-b>", "<Left>")
map("!", "<A-f>", "<S-Right>")
map("!", "<A-b>", "<S-Left>")
map("!", "<C-d>", "<Del>")

map("n", "<C-q>", "<cmd>copen<cr>")
map("n", "<C-z>", "<cmd>lopen<cr>")

map("t", "JK", "<C-\\><C-n>")

map("c", "<A-n>", "<Down>")
map("c", "<A-p>", "<Up>")
