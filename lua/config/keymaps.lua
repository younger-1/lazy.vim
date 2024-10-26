-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Basic
map("x", "X", '"+x')
map("x", "Y", '"+y')
map("x", "d", '"_d')

map("i", "<C-v>", "<C-g>u<C-r><C-o>+")
map("c", "<C-v>", "<C-r>+")

map("", "<TAB>", "%", { remap = true })
map("", "<C-i>", "<C-i>")

-- map("n", "<BS>", "<C-^>")
-- map({ "n", "i" }, "<C-s>", "<cmd>update<cr>", { desc = "Save File" })

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

-- Advanced
vim.cmd([[
command! QuitWindowOrBuffer cclose | lclose | try | close | catch /E444/ | bd | endtry
]])
map("n", [[\q]], "<cmd>QuitWindowOrBuffer<cr>")
map("n", [[\Q]], "<cmd>q<cr>")

map("n", [[\w]], "<cmd>update<cr>")
map("n", [[\W]], "<cmd>wa<cr>")

map("n", [[\z]], "<cmd>stop<cr>")

map({ "n", "x" }, [[\s]], ":so<cr>")

map("x", [[\p]], function()
  local text = require("util").get_visual_selection()
  vim.fn.feedkeys(vim.keycode("<Esc>") .. ":=" .. text, "n")
end, { desc = "Inspect (=)" })
map("x", [[\l]], function()
  local text = require("util").get_visual_selection()
  vim.fn.feedkeys(vim.keycode("<Esc>") .. ":lua " .. text, "n")
end, { desc = "Inspect (lua)" })

-- Leader
map("n", "<leader>`", "<cmd>intro<cr>") -- TODO: Bug report
map("n", "<leader><cr>", "<cmd>message<cr>")

map("n", "<leader>vi", "<cmd>Inspect<cr>")
map("n", "<leader>vI", "<cmd>InspectTree<cr>")
