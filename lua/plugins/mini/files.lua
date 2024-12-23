return {
  { import = "lazyvim.plugins.extras.editor.mini-files" },
  {
    "echasnovski/mini.files",
    opts = {
      -- stylua: ignore
      mappings = {
        -- close       = 'q',
        -- go_in       = 'l',
        go_in_plus  = '<CR>',
        -- go_out      = 'h',
        -- go_out_plus = 'H',
        -- mark_goto   = "'",
        -- mark_set    = 'm',
        -- reset       = '<BS>',
        reveal_cwd  = 'gd',
        show_help   = 'gh',
        -- synchronize = '=',
        -- trim_left   = '<',
        -- trim_right  = '>',
      },
    },
  },
}
