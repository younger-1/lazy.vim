if not vim.g.vscode then
  return {}
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimKeymaps",
  callback = function()
    local map = vim.keymap.set

    map("", "<tab>", "%", { remap = true })
    map("", "<S-tab>", "g%", { remap = true })

    map("", "<C-o>", "<cmd>call VSCodeNotify('workbench.action.navigateBack')<cr>")
    map("", "<C-i>", "<cmd>call VSCodeNotify('workbench.action.navigateForward')<cr>")

    -- [ctrl-tab] in all editor groups
    map("n", "<BS>", "<cmd>call VSCodeNotify('workbench.action.quickOpenPreviousRecentlyUsedEditor')<cr>")
    -- [edt mru]
    map("n", "<S-BS>", "<cmd>call VSCodeNotify('workbench.action.showAllEditorsByMostRecentlyUsed')<cr>")

    -- [edt]
    map("n", "<leader>fb", "<cmd>call VSCodeNotify('workbench.action.showAllEditors')<cr>")
    -- [edt active]
    map("n", "<leader>fB", "<cmd>call VSCodeNotify('workbench.action.showEditorsInActiveGroup')<cr>")

    -- VSCode-specific keymaps for search and navigation
    -- map("n", "<leader><space>", "<cmd>Find<cr>")
    map("n", "<leader><space>", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>")
    -- map("n", "<leader>/", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>")
    map("n", "<leader>/", "<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>")
    map("n", "<leader>sg", "<Cmd>call VSCodeNotify('workbench.action.quickTextSearch')<CR>")

    -- [cmd-shift-o]
    map("n", "g<space>", "<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>")
    -- [cmd-shift-.]
    map("n", "g<cr>", "<Cmd>call VSCodeNotify('breadcrumbs.focusAndSelect')<CR>")

    -- Keep undo/redo lists in sync with VsCode
    map("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    map("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

    -- Navigate VSCode tabs like lazyvim buffers
    map("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    map("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  end,
})
