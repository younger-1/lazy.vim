local function get_terminal_buffers()
  return vim.tbl_filter(function(buf)
    return vim.bo[buf].buftype == "terminal"
  end, vim.api.nvim_list_bufs())
end

local function get_terminal_windows()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  return vim.tbl_filter(function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.api.nvim_win_get_tabpage(win) == current_tabpage and vim.bo[buf].buftype == "terminal"
  end, vim.api.nvim_list_wins())
end

local function create_terminal_buffer()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("filetype", "terminal", { buf = buf })
  return buf
end

local function create_terminal_window(buf)
  return vim.api.nvim_open_win(buf, true, {
    split = "below",
    style = "minimal",
  })
end

local function create_or_open_terminal()
  local windows = get_terminal_windows()
  local buffers = get_terminal_buffers()
  local buf = next(buffers) == nil and create_terminal_buffer() or buffers[1]
  local win = next(windows) == nil and create_terminal_window(buf) or windows[1]
  if next(buffers) == nil then
    vim.fn.termopen(vim.o.shell)
  end
  return win
end

local function toggle_terminal()
  if vim.list_contains(get_terminal_windows(), vim.api.nvim_get_current_win()) then
    vim.cmd.close()
  else
    create_or_open_terminal()
  end
end

return {
  toggle = toggle_terminal,
}
