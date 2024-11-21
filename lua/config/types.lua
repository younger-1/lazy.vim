---@meta

---@class PluginLspOpts
---@field diagnostics vim.diagnostic.Opts

---@generic T
---@param method 'keep'|'force' Decides what to do if a key is found in more than one map:
---      - "keep":  use value from the leftmost map
---      - "force": use value from the rightmost map
---@param ... T Two or more tables
---@return T (table) Merged table
function vim.my_tbl_deep_extend(method, ...) end
