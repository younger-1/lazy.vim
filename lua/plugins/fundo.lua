---@type LazySpec
return {
  {
    "kevinhwang91/nvim-fundo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    build = function()
      require("fundo").install()
    end,
  },
}
