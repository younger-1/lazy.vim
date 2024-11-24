return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
    keys = {
      { ";", ":", mode = { "n", "x" } },
      {
        ":",
        function()
          vim.cmd("silent! NoiceDisable")
          vim.fn.feedkeys(":", "n")
          vim.defer_fn(function()
            vim.cmd("silent! NoiceEnable")
          end, 5000)
          -- vim.cmd([[autocmd CmdlineLeave * ++once silent! NoiceEnable]])
        end,
        mode = { "n", "x" },
      },
    },
  },
}
