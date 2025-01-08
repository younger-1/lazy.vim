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

function M.root()
  return LazyVim.root.get()
end

-- display cwd in prompt title
-- first item is root of current buffer, not displayed if equal cwd
-- last item is $PWD (where nvim launched), not displayed if equals cwd
function M.change_cwd()
  local pwd = vim.fn.fnamemodify(vim.env.PWD, ":~:.")
  local cwd = vim.fn.fnamemodify(vim.uv.cwd() or "", ":~:.")

  -- 1. first item is root of current buf
  -- 2. in case no buffer opened yet
  -- 3. filter out same root
  local cwd_root = vim.fn.fnamemodify(LazyVim.root.get(), ":~:.")

  ---@alias cwd.Item {buf:string,name:string,root:string}
  ---@type cwd.Item[]
  local items = vim
    .iter(vim.api.nvim_list_bufs())
    :filter(vim.api.nvim_buf_is_loaded)
    :filter(function(buf)
      return vim.api.nvim_buf_get_name(buf) ~= ""
    end)
    :map(function(buf)
      ---@type cwd.Item
      return {
        buf = tostring(buf),
        name = vim.fs.basename(vim.api.nvim_buf_get_name(buf)),
        root = vim.fn.fnamemodify(LazyVim.root.get({ buf = buf }), ":~:."),
      }
    end)
    :filter(function(item)
      return item.root ~= pwd and item.root ~= cwd and item.root ~= cwd_root
    end)
    :totable()

  if cwd_root ~= cwd then
    local buf = vim.api.nvim_get_current_buf()
    table.insert(items, 1, {
      buf = tostring(buf),
      name = vim.fs.basename(vim.api.nvim_buf_get_name(buf)),
      root = cwd_root,
    } --[[@as cwd.Item]])
  end
  if pwd ~= cwd and pwd ~= cwd_root then
    table.insert(items, { buf = "-", name = "$PWD", root = pwd })
  end

  local widths = { 0, 0, 0 }
  for _, item in ipairs(items) do
    widths[1] = math.max(widths[1], vim.api.nvim_strwidth(item.root))
    widths[2] = math.max(widths[2], vim.api.nvim_strwidth(item.buf))
    widths[3] = math.max(widths[3], vim.api.nvim_strwidth(item.name))
  end
  vim.ui.select(items, {
    prompt = "Change cwd (" .. cwd .. ")",
    ---@param item cwd.Item
    format_item = function(item)
      local parts = { item.root, item.buf, item.name }
      for i, part in ipairs(parts) do
        parts[i] = part .. string.rep(" ", widths[i] - vim.api.nvim_strwidth(part))
      end
      return table.concat(parts, " ▏")
      -- return item.root .. (" "):rep(20 - #item.root) .. " [" .. item.buf .. "] " .. item.name
    end,
  }, function(choice)
    if choice then
      vim.cmd.tcd(choice.root)
    end
  end)
end

function M.switch_to_test()
  -- local file_path = vim.api.nvim_buf_get_name(0)
  -- local file_name = vim.fs.basename(file_path)
  -- local file_dir = vim.fs.dirname(file_path)
  local file_dir = vim.fn.expand("%:h")
  local file_ext = vim.fn.expand("%:t:e")
  local file_root = vim.fn.expand("%:t:r")
  local is_test = false
  if file_root:match("test") then
    is_test = true
    file_root = file_root:gsub("_?test", "")
  end

  local test_files = vim.fs.find(function(name, path)
    return name:match(string.format("%s", file_root))
      and name:match(string.format("%s$", file_ext))
      and ((not is_test and name:match("test")) or (is_test and not name:match("test")))
  end, { path = file_dir, type = "file", limit = math.huge })

  if #test_files <= 1 then
    U.open_file(test_files[1])
    return
  end

  vim.ui.select(test_files, {
    prompt = "Switch to test",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      U.open_file(choice)
    end
  end)
end

return M
