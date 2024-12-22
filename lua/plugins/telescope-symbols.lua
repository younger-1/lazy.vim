return {
  {
    "nvim-telescope/telescope-symbols.nvim",
    keys = {
      {
        "<leader>sss",
        function()
          vim.cmd("Telescope symbols")
        end,
        desc = "Symbols",
      },
      {
        "<leader>sse",
        function()
          require("telescope.builtin").symbols({ sources = { "emoji" } })
        end,
        desc = "Emoji",
      },
      {
        "<leader>ssg",
        function()
          require("telescope.builtin").symbols({ sources = { "gitmoji" } })
        end,
        desc = "Git",
      },
      {
        "<leader>ssj",
        function()
          require("telescope.builtin").symbols({ sources = { "julia" } })
        end,
        desc = "Julia",
      },
      {
        "<leader>ssk",
        function()
          require("telescope.builtin").symbols({ sources = { "kaomoji" } })
        end,
        desc = "Kaomoji",
      },
      {
        "<leader>ssl",
        function()
          require("telescope.builtin").symbols({ sources = { "latex" } })
        end,
        desc = "LaTeX",
      },
      {
        "<leader>ssm",
        function()
          require("telescope.builtin").symbols({ sources = { "math" } })
        end,
        desc = "Math",
      },
      {
        "<leader>ssn",
        function()
          require("telescope.builtin").symbols({ sources = { "nerd" } })
        end,
        desc = "Nerd",
      },
    },
  },
}
