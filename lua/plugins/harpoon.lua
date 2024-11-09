return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    {
      "<leader>ba",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon add file",
    },
    {
      "<leader>bb",
      function()
        if vim.v.count == 0 then
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        else
          require("harpoon"):list():select(vim.v.count)
        end
      end,
      desc = "Harpoon quick menu",
    },
    -- {
    --   "<leader>bp",
    --   function()
    --     local harpoon = require("harpoon")
    --     harpoon:list():prev()
    --   end,
    --   desc = "Harpoon prev",
    -- },
    -- {
    --   "<leader>bn",
    --   function()
    --     local harpoon = require("harpoon")
    --     harpoon:list():next()
    --   end,
    --   desc = "Harpoon next",
    -- },
  },
  config = function()
    require("harpoon"):setup({})
  end,
}
