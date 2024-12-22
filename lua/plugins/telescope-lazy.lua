return {
  {
    "tsakirist/telescope-lazy.nvim",
    keys = {
      { "<leader>sx", "<cmd>Telescope lazy<cr>", desc = "Lazy plugins" },
    },
    specs = {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions = {
          lazy = {
            theme = "ivy",
            show_icon = true,
            mappings = {
              open_in_browser = "<C-o>",
              open_in_find_files = "<C-f>",
              open_in_live_grep = "<C-g>",
              open_in_file_browser = "<C-b>",
              open_in_terminal = "<C-t>",
              open_plugins_picker = "<C-o>", -- Works only after having called first another action
              open_lazy_root_find_files = "<C-r>f",
              open_lazy_root_live_grep = "<C-r>g",
              change_cwd_to_plugin = "<C-r>d",
            },
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("lazy")
    end,
  },
}
