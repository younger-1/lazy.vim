return {
  {
    "AndrewRadev/linediff.vim",
    cmd = { "Linediff", "LinediffAdd", "LinediffShow", "LinediffLast", "LinediffMerge", "LinediffPick" },
    keys = {
      { "<leader>gvd", ":Linediff<cr>", mode = { "x" } },
      { "<leader>gva", ":LinediffAdd<cr>", mode = { "x" } },
      { "<leader>gvl", ":LinediffLast<cr>", mode = { "x" } },
      { "<leader>gvs", "<cmd>LinediffShow<cr>" },
      { "<leader>gvm", "<cmd>LinediffMerge<cr>" },
      { "<leader>gvp", "<cmd>LinediffPick<cr>" },
    },
    init = function()
      -- TODO: use `b:differ.description`
      vim.g.linediff_modify_statusline = 0
      -- stop the linediff with `q`
      vim.cmd("autocmd User LinediffBufferReady nnoremap <buffer> q <cmd>LinediffReset<cr>")
    end,
  },
}
