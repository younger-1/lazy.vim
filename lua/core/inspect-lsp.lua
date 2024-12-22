---@param client_name? string
local function render_lsp_info(client_name)
  local clients
  if client_name then
    clients = vim.lsp.get_clients({ name = client_name })
    if #clients == 0 then
      vim.notify("No active LSP clients found with this name: " .. client_name, vim.log.levels.WARN)
      return
    end
  else
    local bufnr = vim.api.nvim_get_current_buf()
    clients = vim.lsp.get_clients({ bufnr = bufnr })
  end

  -- Create a temporary buffer to show the configuration
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.floor(vim.o.columns * 0.75),
    height = math.floor(vim.o.lines * 0.90),
    col = math.floor(vim.o.columns * 0.125),
    row = math.floor(vim.o.lines * 0.05),
    style = "minimal",
    border = "rounded",
    title = " LSP Client ",
    title_pos = "center",
  })

  local lines = {}
  for i, this_client in ipairs(clients) do
    if i > 1 then
      table.insert(lines, "")
      table.insert(lines, "")
      table.insert(lines, string.rep("-", 80))
    end
    table.insert(lines, "name: " .. this_client.name)
    table.insert(lines, "id: " .. this_client.id)
    table.insert(lines, "offset_encoding: " .. this_client.offset_encoding)
    table.insert(lines, "root_dir: " .. this_client.root_dir)
    table.insert(lines, "")
    table.insert(lines, "config:")
    vim.list_extend(lines, vim.split(vim.inspect(this_client.config), "\n"))
    table.insert(lines, "")
    table.insert(lines, "server_capabilities:")
    vim.list_extend(lines, vim.split(vim.inspect(this_client.server_capabilities), "\n"))
  end

  -- Set the lines in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Set buffer options
  vim.bo[buf].modifiable = false
  vim.bo[buf].filetype = "lua"
  vim.bo[buf].bh = "delete"

  vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>q<cr>", { noremap = true, silent = true })
end

local select_client_fzf = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  local client_names = {}
  for _, client in ipairs(clients) do
    table.insert(client_names, client.name)
  end

  if #client_names == 0 then
    return
  elseif #client_names == 1 then
    -- single client open settings directly
    render_lsp_info(client_names[1])
    return
  end

  local sink = function(selected)
    if #selected < 2 then
      return
    end
    render_lsp_info(selected[2])
  end

  local wrapped_opts = vim.fn["fzf#wrap"]({ source = client_names, options = { "--prompt", "Buffer Clients> " } })
  wrapped_opts["sink*"] = sink
  vim.fn["fzf#run"](wrapped_opts)
end

---Options passed to command
---@param opts { fargs: string[]; bang: boolean }
local function inspect_lsp_client(opts)
  if opts.fargs[1] ~= nil then
    -- Argument passed to command
    render_lsp_info(opts.fargs[1])
  elseif opts.bang then
    -- Select lsps attached in current buffer in fzf
    select_client_fzf()
  else
    -- vim.ui.input({ prompt = "Enter LSP Client name: " }, render_lsp_info)
    vim.ui.select(vim.lsp.get_clients(), {
      prompt = "Select client:",
      format_item = function(item)
        return ("%s  ft:%s  dir:%s  auto:%s"):format(
          item.name,
          table.concat(item.config.filetypes, "/"),
          item.root_dir,
          item.config.autostart
        )
        -- return item.name
      end,
    }, function(choice)
      render_lsp_info(choice and choice.name)
    end)
  end
end

-- Usage
--
-- Get prompted:
-- :InspectLspClient
--
-- Open directly:
-- :InspectLspClient client_name
--
-- Fuzzy select client from current buffer:
-- :InspectLspClient!
--
-- @see https://www.reddit.com/r/neovim/comments/1gf7kyn/lsp_configuration_debugging/
-- @also :checkhealth vim.lsp
vim.api.nvim_create_user_command("InspectLspClient", inspect_lsp_client, { nargs = "?", bang = true })
