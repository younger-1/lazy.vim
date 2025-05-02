return {
  "bassamsdata/namu.nvim",
  cmd = "Namu",
  opts = {},
  init = function()
    vim.keymap.set("n", "<leader>jj", "<cmd>Namu symbols<cr>")
    vim.keymap.set("n", "<leader>jw", "<cmd>Namu workspace<cr>")
    vim.keymap.set("n", "<leader>jb", "<cmd>Namu watchtower<cr>")
    vim.keymap.set("n", "<leader>jd", "<cmd>Namu diagnostics<cr>")
    vim.keymap.set("n", "<leader>ja", "<cmd>Namu diagnostics workspace<cr>")
    vim.keymap.set("n", "<leader>j[", "<cmd>Namu call in<cr>")
    vim.keymap.set("n", "<leader>j]", "<cmd>Namu call out<cr>")
    vim.keymap.set("n", "<leader>jc", "<cmd>Namu ctags<cr>")
    vim.keymap.set("n", "<leader>j?", "<cmd>Namu help<cr>")
    vim.keymap.set("n", "<leader>jhs", "<cmd>Namu help symbols<cr>")
    vim.keymap.set("n", "<leader>jha", "<cmd>Namu help analysis<cr>")
  end,
}
