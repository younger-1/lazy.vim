return {
  "nvzone/menu",
  dependencies = "nvzone/volt",
  -- keys = {
  --   {
  --     "<C-t>",
  --     function()
  --       require("menu").open("default")
  --     end,
  --   },
  --   {
  --     "<RightMouse>",
  --     function()
  --       local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  --       require("menu").open(options, { mouse = true })
  --     end,
  --   },
  -- },
  opts_extend = { "common" },
  opts = {
    special = {},
    common = require("plugins.menu.cfg.common"),
    ft = {},
  },
  config = function(_, opts)
    -- vim.keymap.set({ "n", "x" }, "<C-t>", function()
    --   local items = vim.deepcopy(opts.special[vim.bo.ft] or opts.common)
    --   if opts.ft[vim.bo.ft] then
    --     items[#items + 1] = { name = "separator" }
    --     items = vim.list_extend(items, opts.ft[vim.bo.ft])
    --   end
    --   require("menu").open(items)
    -- end)
    vim.keymap.set({ "n", "x" }, "<RightMouse>", function()
      local items = vim.deepcopy(opts.special[vim.bo.ft] or opts.common)
      if opts.ft[vim.bo.ft] then
        items[#items + 1] = { name = "separator" }
        items = vim.list_extend(items, opts.ft[vim.bo.ft])
      end
      require("menu").open(items)
    end)
  end,
}
