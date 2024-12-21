return {
  {
    "debugloop/telescope-undo.nvim",
    keys = {
      { "<leader>sU", "<cmd>Telescope undo<cr>", desc = "Undo" },
    },
    specs = {
      "nvim-telescope/telescope.nvim",
      opts = {
        extensions = {
          undo = {
            layout_strategy = "vertical",
            layout_config = {
              width = 0.6,
              preview_height = 0.7,
            },
            --
            use_delta = false,
            side_by_side = false,
            mappings = {
              i = {
                -- ['<cr>'] = require('telescope-undo.actions').yank_additions,
                -- ['<S-cr>'] = require('telescope-undo.actions').yank_deletions,
                -- ['<C-cr>'] = require('telescope-undo.actions').restore,
                -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                -- ['<C-y>'] = function() require('telescope-undo.actions').yank_deletions end,
                -- ['<C-r>'] = function() require('telescope-undo.actions').restore end,
              },
            },
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("undo")
    end,
  },
}
