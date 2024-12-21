return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>au", vim.cmd.UndotreeToggle, desc = "Undo tree" },
    },
    init = function()
      local g = vim.g

      g.undotree_SetFocusWhenToggle = 1
      g.undotree_WindowLayout = 4
      g.undotree_DiffAutoOpen = 1
      g.undotree_ShortIndicators = 1

      g.undotree_TreeNodeShape = "●"
      g.undotree_TreeVertShape = "│"
      g.undotree_TreeSplitShape = "╱"
      g.undotree_TreeReturnShape = "╲"

      -- g.undotree_HighlightSyntaxAdd = "DiffAdd"
      -- g.undotree_HighlightSyntaxDel = "DiffDelete"
      -- g.undotree_HighlightSyntaxChange = "DiffChange"
    end,
  },
}
