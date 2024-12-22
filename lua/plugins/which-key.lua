return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      plugins = {
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
      win = {
        border = "rounded", -- none, single, double, rounded, solid, shadow
        wo = {
          winblend = 15, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
    },
  },
}
