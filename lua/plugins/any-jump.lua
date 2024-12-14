return {
  {
    "pechorin/any-jump.vim",
    cmd = { "AnyJump", "AnyJumpVisual", "AnyJumpArg" },
    keys = {
      { "go", ":AnyJump<cr>" },
      { "go", ":AnyJumpVisual<cr>", mode = "x" },
      { "gob", ":AnyJumpBack<cr>" },
      { "gol", ":AnyJumpLastResults<cr>" },
    },
    init = function()
      vim.g.any_jump_disable_default_keybindings = 1
    end,
  },
}
