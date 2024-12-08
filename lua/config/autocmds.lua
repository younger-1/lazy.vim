-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds:
-- - https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- - $LAZYVIM_DIR/lua/lazyvim/config/autocmds.lua

local function augroup(name)
  return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = {
    "markdown",
  },
  callback = function()
    vim.opt_local.wrap = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "close with <q>",
  group = augroup("close_win_or_buf_with_q"),
  pattern = {
    "help",
    "git",
    "fugitive",
    "floggraph",
    "gitgraph",
  },
  callback = function(event)
    vim.schedule(function() -- NOTE: override lazyvim
      vim.keymap.set("n", "q", "<cmd>QuitWindowOrBuffer<cr>", {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "enable show and switch to some special buffer",
  group = augroup("enabl_show_switch_special_buf"),
  pattern = {
    "floggraph",
    "gitgraph",
  },
  callback = function(event)
    vim.bo.buflisted = true
    vim.bo.bufhidden = "hide"
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
    vim.bo.tabstop = 2
    vim.bo.keywordprg = ":help"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "add border to float window",
  group = augroup("add_border"),
  pattern = {
    "lazy",
    "mason",
    "any-jump",
  },
  callback = function(event)
    vim.api.nvim_win_set_config(0, { border = "rounded" })
  end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter", "TabEnter" }, {
--   desc = "show tabline when bufs > 1 or tabs > 1",
--   pattern = "*",
--   group = augroup("show_tabline"),
--   callback = function()
--     -- if #vim.fn.gettabinfo() then end
--     vim.schedule(function()
--       local status = #vim.fn.getbufinfo({ buflisted = 1 }) > 1 and 2 or 1
--       vim.print(status)
--       if vim.o.showtabline ~= status then
--         vim.o.showtabline = status
--       end
--     end)
--   end,
-- })
