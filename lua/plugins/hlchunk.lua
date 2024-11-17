return {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  -- {
  --   "yaocccc/nvim-hlchunk",
  --   event = { "LazyFile" },
  -- },
  {
    "shellRaining/hlchunk.nvim",
    event = { "LazyFile" },
    config = function()
      require("hlchunk").setup({
        chunk = { -- 指示当前光标所在的一个 chunk（比如 function_declaration，if_statement）等
          enable = true,
          textobject = "iC", -- 提供了 textobject 方便你快速的操作这个 chunk
          duration = 300,
          delay = 100,
          chars = {
            -- horizontal_line = "─",
            -- vertical_line = "│",
            -- left_top = "┌",
            -- left_bottom = "└",
            -- right_arrow = "─",
            --
            -- horizontal_line = "━",
            -- vertical_line = "┃",
            -- left_top = "┏",
            -- left_bottom = "┗",
            -- right_arrow = "━",
          },
        },
        indent = {
          enable = false,
        },
        blank = {
          enable = false,
          chars = {
            " ",
          },
          style = {
            { bg = "#434437" },
            { bg = "#2f4440" },
            { bg = "#433054" },
            { bg = "#284251" },
          },
        },
        line_num = {
          enable = false,
        },
      })
    end,
  },
}
