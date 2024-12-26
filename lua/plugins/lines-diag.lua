return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "BufReadPost",
    keys = {
      {
        "<leader>lt",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Lsp lines",
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}
