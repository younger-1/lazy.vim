---@type LazySpec
return {
  {
    "danielfalk/smart-open.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    keys = {
      -- { "<leader><leader>", "<cmd>Telescope smart_open<cr>", desc = "Smart frecency" },
      {
        "<leader><leader>",
        function()
          require("telescope").extensions.smart_open.smart_open({
            cwd = LazyVim.root(),
          })
        end,
        desc = "Smart frecency",
      },
    },
    specs = {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions = {
          smart_open = {
            show_scores = true,
            match_algorithm = "fzf",
            open_buffer_indicators = { previous = "#", others = "*" },
          },
        },
      },
    },
    init = function()
      -- To record most recent files opened by telescope
      LazyVim.on_load("telescope.nvim", function()
        vim.cmd("Lazy load smart-open.nvim")
      end)
    end,
    config = function()
      require("telescope").load_extension("smart_open")
    end,
  },
}
