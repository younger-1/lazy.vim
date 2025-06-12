if not vim.g.vscode then
  return {}
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymapsDefaults",
  callback = function()
    local map = vim.keymap.set

    map("", "<tab>", "%", { remap = true })
    map("", "<S-tab>", "g%", { remap = true })
    map("n", "<BS>", "<C-^>")

    -- VSCode-specific keymaps for search and navigation
    map("n", "<leader><space>", "<cmd>Find<cr>")
    map("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    map("n", "g<space>", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])
    map("n", "g<cr>", "<Cmd>call VSCodeNotify('breadcrumbs.focusAndSelect')<CR>")

    -- Keep undo/redo lists in sync with VsCode
    map("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    map("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

    -- Navigate VSCode tabs like lazyvim buffers
    map("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    map("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  end,
})
