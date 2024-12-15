return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        -- default:
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},

        -- section_separators = "",
        -- component_separators = "",

        section_separators = "",
        component_separators = "│",

        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "│", right = "│" },

        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
      },
      extensions = {
        "aerial",
        "chadtree",
        "ctrlspace",
        "fern",
        "fugitive",
        "fzf",
        "lazy",
        "man",
        "mason",
        "mundo",
        "neo-tree",
        "nerdtree",
        "nvim-dap-ui",
        "nvim-tree",
        "oil",
        "overseer",
        "quickfix",
        "symbols-outline",
        "toggleterm",
        "trouble",
      },
    },
  },
}
