return {
  {
    "hrsh7th/nvim-deck",
    cmd = "Deck",
    keys = { "," },
    config = function()
      require("deck").setup({
        max_history_size = 10,
        default_start_config = {
          view = function()
            return require("deck.builtin.view.default").create({
              max_height = math.floor(vim.o.lines * 0.25),
            })
          end,
        },
        -- guicursor = "a:ver25",
      })

      local augroup = vim.api.nvim_create_augroup("my_deck", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        group = augroup,
        pattern = "DeckShow",
        callback = function()
          -- vim.wo.winhighlight = "CursorLine:Visual"
        end,
      })

      -- Set up buffer-specific key mappings for nvim-deck.
      vim.api.nvim_create_autocmd("User", {
        group = augroup,
        pattern = "DeckStart",
        callback = function(e)
          local ctx = e.data.ctx --[[@as deck.Context]]
          local deck = require("deck")

          ctx.keymap("n", "q", ctx.hide)
          ctx.keymap("n", "<Esc>", function()
            ctx.set_preview_mode(false)
          end)

          -- registered in plugin, by require('deck.builtin.action')
          ctx.keymap("n", "<Tab>", deck.action_mapping("choose_action"))
          ctx.keymap("n", "<C-l>", deck.action_mapping("refresh"))
          ctx.keymap("n", "i", deck.action_mapping("prompt"))
          ctx.keymap("n", "a", deck.action_mapping("prompt"))
          ctx.keymap("n", "@", deck.action_mapping("toggle_select"))
          ctx.keymap("n", "*", deck.action_mapping("toggle_select_all"))
          ctx.keymap("n", "p", deck.action_mapping("toggle_preview_mode"))
          ctx.keymap("n", "o", deck.action_mapping("open"))
          ctx.keymap("n", "O", deck.action_mapping("open_keep"))
          ctx.keymap("n", "<C-s>", deck.action_mapping("open_split"))
          ctx.keymap("n", "<C-v>", deck.action_mapping("open_vsplit"))
          ctx.keymap("n", "<C-u>", deck.action_mapping("scroll_preview_up"))
          ctx.keymap("n", "<C-d>", deck.action_mapping("scroll_preview_down"))

          -- registered by require('deck').alias_action
          ctx.keymap("n", "<CR>", deck.action_mapping("default"))
          ctx.keymap("n", "d", deck.action_mapping("delete"))
          ctx.keymap("n", "N", deck.action_mapping("create"))

          -- If you want to start the filter by default, call ctx.prompt() here
          -- ctx.prompt()
        end,
      })

      vim.keymap.set("n", ",dh", "<Cmd>Deck helpgrep<CR>", { desc = "Help grep" })
      vim.keymap.set("n", ",du", "<Cmd>Deck deck.history<CR>", { desc = "History" })

      -- Show the latest deck context.
      vim.keymap.set("n", ",dd", function()
        local ctx = require("deck").get_history()[vim.v.count1]
        if ctx then
          ctx.show()
        end
      end, { desc = "Deck show" })

      -- Do default action on next item.
      vim.keymap.set("n", ",dn", function()
        local ctx = require("deck").get_history()[vim.v.count1]
        if ctx then
          ctx.set_cursor(ctx.get_cursor() + 1)
          ctx.do_action("default")
        end
      end, { desc = "Deck next item" })

      -- Apply pre-defined easy settings.
      -- For manual configuration, refer to the code in `deck/easy.lua`.
      require("deck.easy").setup()
      -- Example key bindings for launching nvim-deck sources. (These mapping required `deck.easy` calls.)
      vim.keymap.set("n", ",df", "<Cmd>Deck files<CR>", { desc = "File/Buffer/Recent" })
      vim.keymap.set("n", ",db", "<Cmd>Deck buffers<CR>", { desc = "Buffers" })
      vim.keymap.set("n", ",ds", "<Cmd>Deck grep<CR>", { desc = "Search" })
      vim.keymap.set("n", ",dg", "<Cmd>Deck git<CR>", { desc = "Git" })

      -- After registration, you can start the preset using the `:Deck recent` command.
      require("deck").register_start_preset("recent", function()
        require("deck").start({
          require("deck.builtin.source.recent_files")(),
          require("deck.builtin.source.buffers")(),
        })
      end)
      vim.keymap.set("n", ",dr", "<Cmd>Deck recent<CR>", { desc = "Recent/Buffer" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { ",d", group = "deck" },
      },
    },
  },
}
