local M = {}

M.get_visual_selection = function()
  local lines = vim.fn.getregion(vim.fn.getpos("."), vim.fn.getpos("v"), { type = vim.fn.mode() })
  return table.concat(lines)
end

return M
