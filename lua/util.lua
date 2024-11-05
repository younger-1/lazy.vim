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

return M
