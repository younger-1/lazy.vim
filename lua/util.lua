local M = {}

M.get_visual_selection = function()
  local lines = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { type = vim.fn.mode() })
  return table.concat(lines)
end

---Check if a certain feature/version/commit exists in nvim
---@param feature string
---@return boolean
M.has = function(feature)
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

return M
