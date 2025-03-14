return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          move = {
            enable = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]a"] = "@argument.outer",
              ["]m"] = "@method.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[a"] = "@argument.outer",
              ["[m"] = "@method.outer",
            },
          },
        },
      })
    end,
  },
}
