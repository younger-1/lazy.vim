return {
  "nvzone/menu",
  dependencies = "nvzone/volt",
  keys = {
    { "<C-t>" },
    { "<RightMouse>" },
  },
  opts_extend = { "common" },
  opts = {
    special = {},
    common = {},
    ft = {},
  },
  config = function(_, opts)
    opts.common = require("plugins.menu.common")
    local function open_menu(mouse)
      local items = vim.deepcopy(opts.special[vim.bo.ft] or opts.common)
      if opts.ft[vim.bo.ft] then
        items[#items + 1] = { name = "separator" }
        items = vim.list_extend(items, opts.ft[vim.bo.ft])
      end
      require("menu").open(items, { mouse = mouse })
    end

    vim.keymap.set({ "n", "x" }, "<C-t>", open_menu)
    vim.keymap.set({ "n", "x" }, "<RightMouse>", function()
      open_menu(true)
    end)
  end,
}
