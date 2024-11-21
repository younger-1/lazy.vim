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

vim.api.nvim_create_autocmd("FileType", {
  desc = "close with <q>",
  group = augroup("close_with_q"),
  pattern = {
    "help",
  },
  callback = function(event)
    vim.schedule(function()
      vim.keymap.set("n", "q", "<cmd>QuitWindowOrBuffer<cr>", {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "go: set local option",
  group = augroup("go_option"),
  pattern = {
    "go",
  },
  callback = function(event)
    vim.bo.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "lua: set local option",
  group = augroup("lua_option"),
  pattern = {
    "lua",
  },
  callback = function(event)
    vim.bo.keywordprg = ":help"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "add border to float window",
  group = augroup("add_border"),
  pattern = {
    "any-jump",
    "lazy",
    "mason",
  },
  callback = function(event)
    vim.api.nvim_win_set_config(0, { border = "rounded" })
  end,
})
