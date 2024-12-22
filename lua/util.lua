local M = {}

function M.get_visual_selection()
  local lines = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { type = vim.fn.mode() })
  return table.concat(lines)
end

---Check if a certain feature/version/commit exists in nvim
---@param feature string
---@return boolean
function M.has(feature)
  return vim.fn.has(feature) > 0
end

function M.open_file(file, lnum, col)
  if vim.fn.bufexists(file) == 1 then
    vim.cmd.buffer(file)
    vim.o.buflisted = true
  else
    vim.cmd.edit(file)
  end

  if lnum then
    col = col or 1
    vim.api.nvim_win_set_cursor(0, { lnum, col - 1 })
  end
end

local function get_line_number()
  return vim.api.nvim_win_get_cursor(0)[1]
end

function M.get_line_content()
  return vim.api.nvim_buf_get_lines(0, get_line_number() - 1, get_line_number(), false)[1]
end

function M.make_words_from_string(s)
  local words = {}
  for word in s:gmatch("%w+") do
    table.insert(words, word)
  end
  return words
end

return M
