local spec = vim.list_extend({}, require("lazyvim.plugins.lsp.keymaps").get())

local disabled = {}
for _, key in ipairs(spec) do
  if key[2] == false then
    disabled[key[1]] = true
  end
end

local function strip(lhs)
  if type(lhs) == "function" then
    return lhs
  end
  if vim.startswith(lhs, "<cmd>") then
    return string.sub(lhs, #"<cmd>" + 1, -#"<cr>" - 1)
  end
  return lhs
end

local items = {}
for _, key in ipairs(spec) do
  if not disabled[key[1]] then
    items[#items + 1] = {
      name = key.desc,
      cmd = strip(key[2]),
      rtxt = key[1],
    }
  end
end

return vim.list_extend(items, {
  { name = "separator" },

  {
    name = "Goto Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },

  {
    name = "Goto Declaration",
    cmd = vim.lsp.buf.declaration,
    rtxt = "gD",
  },

  {
    name = "Goto Implementation",
    cmd = vim.lsp.buf.implementation,
    rtxt = "gi",
  },

  { name = "separator" },

  {
    name = "Show signature help",
    cmd = vim.lsp.buf.signature_help,
    rtxt = "<leader>sh",
  },

  {
    name = "Add workspace folder",
    cmd = vim.lsp.buf.add_workspace_folder,
    rtxt = "<leader>wa",
  },

  {
    name = "Remove workspace folder",
    cmd = vim.lsp.buf.remove_workspace_folder,
    rtxt = "<leader>wr",
  },

  {
    name = "Show References",
    cmd = vim.lsp.buf.references,
    rtxt = "gr",
  },

  { name = "separator" },

  {
    name = "Format Buffer",
    cmd = function()
      local ok, conform = pcall(require, "conform")

      if ok then
        conform.format({ lsp_fallback = true })
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>fm",
  },

  {
    name = "Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>ca",
  },
})
