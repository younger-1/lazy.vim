return {
  {
    "AndrewRadev/linediff.vim",
    cmd = { "Linediff", "LinediffAdd", "LinediffShow", "LinediffLast", "LinediffMerge", "LinediffPick" },
    keys = {
      { "<leader>vld", ":Linediff<cr>", mode = { "v" } },
      { "<leader>vla", ":LinediffAdd<cr>", mode = { "v" } },
      { "<leader>vll", ":LinediffLast<cr>", mode = { "v" } },
      { "<leader>vls", "<cmd>LinediffShow<cr>" },
      { "<leader>vlm", "<cmd>LinediffMerge<cr>" },
      { "<leader>vlp", "<cmd>LinediffPick<cr>" },
    },
    init = function()
      -- TODO: use `b:differ.description`
      vim.g.linediff_modify_statusline = 0
      -- stop the linediff with `q`
      vim.cmd("autocmd User LinediffBufferReady nnoremap <buffer> q <cmd>LinediffReset<cr>")
    end,
  },
}
