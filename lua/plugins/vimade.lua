return {
  "TaDaa/vimade",
  event = "WinResized",
  config = function()
    -- Highlight by active buffers or windows. fades buffers by default
    -- let g:vimade.ncmode = 'buffers'
    -- let g:vimade.ncmode = 'windows'
    --
    -- wrong: vim.g.vimade.fadelevel = 0.5
    -- right: let g:vimade.fadelevel = 0.5

    require("vimade").setup({
      fadelevel = function(style, state)
        if vim.tbl_contains({
          "neo-tree",
          "Outline",
        }, style.win.buf_opts.syntax) then
          return 1.0
        else
          return 0.5
        end
      end,
    })

    -- local Default = require("vimade.recipe.default").Default
    -- require("vimade").setup(Default({ animate = true }))
  end,
}
