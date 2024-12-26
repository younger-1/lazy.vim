return {
  --
  -- basic
  --
  {
    "<leader>/",
    function()
      require("telescope.builtin").live_grep({
        cwd = U.root(),
        additional_args = {
          "-F", -- "--fixed-strings"
        },
      })
    end,
    desc = "Grep (no regex)",
  },
  {
    "<leader>,",
    "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
    desc = "Buffers",
  },
  { "<leader>;", "<cmd>Telescope commands<cr>" },
  --
  -- core
  --
  { "<leader>su", "<cmd>Telescope pickers<cr>", desc = "󰚾" },
  { "<leader>s<space>", "<cmd>Telescope resume<cr>", desc = "" },
  { "<leader>s<tab>", "<cmd>Telescope builtin<cr>", desc = "Builtin " },
  { "<leader>s<cr>", "<cmd>Telescope builtin include_extensions=true<cr>", desc = "All " },
  --
  -- misc
  --
  { "<leader>s'", "<cmd>Telescope marks<cr>", desc = "Mark" },
  { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Register" },
  { "<leader>s-", "<cmd>Telescope reloader<cr>", desc = "Reload module" },
  { "<leader>s=", "<cmd>Telescope spell_suggest<cr>", desc = "Spell suggest" },
  {
    "<leader>s;",
    function()
      require("telescope.builtin").command_history({
        prompt_prefix = "$ ",
        filter_fn = function(item)
          -- local ignored_pattern = vim.regex([[^\s]]) -- TODO: fix upstream, not trim prefix space
          local ignored_pattern = vim.regex([[\s$]])
          if #item < 3 then
            return false
          else
            return not ignored_pattern:match_str(item)
          end
        end,
      })
    end,
    desc = "Command history",
  },
  {
    "<leader>s/",
    function()
      require("telescope.builtin").search_history({
        prompt_prefix = "/ ",
        filter_fn = function(item)
          if #item < 3 then
            return false
          else
            return true
          end
        end,
      })
    end,
    desc = "Search history",
  },
  { "<leader>s<C-q>", "<cmd>Telescope quickfix<cr>", desc = "Quick list" },
  { "<leader>s<C-z>", "<cmd>Telescope loclist<cr>", desc = "Loc list" },
  { "<leader>sq", "<cmd>Telescope quickfixhistory<cr>", desc = "QuickList history" },
  {
    "<leader>sk",
    function()
      require("telescope.builtin").keymaps({
        modes = { "n", "i", "c", "x", "o" },
        show_plug = vim.v.count ~= 0,
      })
    end,
    desc = "Keymaps",
  },
  {
    "<leader>sK",
    function()
      require("telescope.builtin").keymaps({
        only_buf = 1, -- @see(my) https://github.com/nvim-telescope/telescope.nvim/pull/2246
        modes = { "n", "i", "c", "x", "o" },
        show_plug = vim.v.count ~= 0,
      })
    end,
    desc = "Keymaps (buf)",
  },
  --
  -- search
  --
  {
    "<leader>sg",
    function()
      require("telescope.builtin").live_grep({
        cwd = U.root(),
      })
    end,
    desc = "Grep (root)",
  },
  {
    "<leader>sG",
    function()
      require("telescope.builtin").live_grep({})
    end,
    desc = "Grep (cwd)",
  },
  {
    mode = "x",
    "<leader>sg",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = U.root(),
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Grep (root)",
  },
  {
    mode = "x",
    "<leader>sG",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({})
      vim.fn.feedkeys(text)
    end,
    desc = "Grep (cwd)",
  },
  {
    "<leader>sA",
    function()
      require("telescope.builtin").live_grep({
        cwd = U.root(),
        follow = true,
        hidden = true,
        no_ignore = true,
      })
    end,
    desc = "Grep (with ignored)",
  },
  {
    mode = "x",
    "<leader>sA",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = U.root(),
        follow = true,
        hidden = true,
        no_ignore = true,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Grep (with ignored)",
  },
  --
  -- word
  --
  {
    "<leader>sw",
    function()
      require("telescope.builtin").grep_string({
        word_match = "-w",
        cwd = U.root(),
      })
    end,
    desc = "Word (root)",
  },
  {
    "<leader>sW",
    function()
      require("telescope.builtin").grep_string({
        word_match = "-w",
      })
    end,
    desc = "Word (cwd)",
  },
  {
    mode = "x",
    "<leader>sw",
    function()
      require("telescope.builtin").grep_string({
        cwd = U.root(),
        search = U.get_visual_selection(),
      })
    end,
    desc = "Word (root)",
  },
  {
    mode = "x",
    "<leader>sW",
    function()
      require("telescope.builtin").grep_string({
        search = U.get_visual_selection(),
      })
    end,
    desc = "Word (cwd)",
  },
  --
  -- find
  --
  {
    "<leader>ff",
    function()
      require("telescope.builtin").find_files({
        cwd = U.root(),
      })
    end,
    desc = "Files (root)",
  },
  {
    "<leader>fF",
    function()
      require("telescope.builtin").find_files({})
    end,
    desc = "Files (cwd)",
  },
  {
    mode = "x",
    "<leader>ff",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = U.root(),
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Files (root)",
  },
  {
    mode = "x",
    "<leader>fF",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({})
      vim.fn.feedkeys(text)
    end,
    desc = "Files (cwd)",
  },
  {
    "<leader>fa",
    function()
      require("telescope.builtin").find_files({
        cwd = U.root(),
        follow = true,
        hidden = true,
        no_ignore = true,
      })
    end,
    desc = "Files (with ignored)",
  },
  {
    mode = "x",
    "<leader>fa",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = U.root(),
        follow = true,
        hidden = true,
        no_ignore = true,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Files (with ignored)",
  },
  --
  -- recent
  --
  {
    "<leader>fh",
    function()
      require("telescope.builtin").oldfiles({
        cwd = U.root(),
      })
    end,
    desc = "Recent (root)",
  },
  {
    "<leader>fH",
    function()
      require("telescope.builtin").oldfiles({})
    end,
    desc = "Recent (cwd)",
  },
  --
  -- git
  --
  { "<leader>gO", "<cmd>Telescope git_status<cr>", desc = "Status (cwd)" },
  {
    "<leader>go",
    function()
      require("telescope.builtin").git_status({
        cwd = U.root(),
      })
    end,
    desc = "Status",
  },
  -- Not need { "<leader>gC", "<cmd>Telescope git_commits<cr>", desc = "Commits (cwd)" },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_commits({
        cwd = U.root(),
      })
    end,
    desc = "Commits",
  },
  -- Not need { "<leader>gH", "<cmd>Telescope git_bcommits<CR>", desc = "Buf commits (cwd)" },
  {
    "<leader>gh",
    function()
      require("telescope.builtin").git_bcommits({
        cwd = U.root(),
      })
    end,
    desc = "Buf commits",
  },
  {
    "<leader>gl",
    function()
      require("telescope.builtin").git_bcommits_range({
        cwd = U.root(),
      })
    end,
    desc = "Line commits",
  },
  {
    mode = "x",
    "<leader>gl",
    function()
      -- vim.fn.feedkeys(vim.keycode("<Esc>"), "n")
      vim.cmd([[exe "normal! \<Esc>"]])
      require("telescope.builtin").git_bcommits_range({
        from = vim.fn.line("'<"),
        to = vim.fn.line("'>"),
      })
    end,
    desc = "Line commits",
  },
  { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
  --
  -- config
  --
  {
    "<leader>yc",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end,
    desc = "Find config file",
  },
  {
    "<leader>yC",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("config"),
      })
    end,
    desc = "Search config file",
  },
  {
    mode = "x",
    "<leader>yc",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find config file",
  },
  {
    mode = "x",
    "<leader>yC",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("config"),
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search config file",
  },
  --
  -- nvim config
  --
  {
    "<leader>yy",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/nvim",
      })
    end,
    desc = "Find young file",
  },
  {
    "<leader>yY",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/nvim",
      })
    end,
    desc = "Search young file",
  },
  {
    mode = "x",
    "<leader>yy",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/nvim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find young file",
  },
  {
    mode = "x",
    "<leader>yY",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/nvim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search young file",
  },
  --
  -- lazy config
  --
  {
    "<leader>yz",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/lazy",
      })
    end,
    desc = "Find lazy file",
  },
  {
    "<leader>yZ",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/lazy",
      })
    end,
    desc = "Search lazy file",
  },
  {
    mode = "x",
    "<leader>yz",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/lazy",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find lazy file",
  },
  {
    mode = "x",
    "<leader>yZ",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/lazy",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search lazy file",
  },
  --
  -- astro config
  --
  {
    "<leader>ya",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/astro",
      })
    end,
    desc = "Find astro file",
  },
  {
    "<leader>yA",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/astro",
      })
    end,
    desc = "Search astro file",
  },
  {
    mode = "x",
    "<leader>ya",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/astro",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find astro file",
  },
  {
    mode = "x",
    "<leader>yA",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fs.dirname(vim.fn.stdpath("config")) .. "/astro",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search astro file",
  },
  --
  -- All plugins
  --
  {
    "<leader>yx",
    function()
      require("telescope.builtin").find_files({
        cwd = require("lazy.core.config").options.root,
      })
    end,
    desc = "Find plugin file",
  },
  {
    "<leader>yX",
    function()
      require("telescope.builtin").live_grep({
        cwd = require("lazy.core.config").options.root,
      })
    end,
    desc = "Search plugin file",
  },
  {
    mode = "x",
    "<leader>yx",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = require("lazy.core.config").options.root,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find plugin file",
  },
  {
    mode = "x",
    "<leader>yX",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = require("lazy.core.config").options.root,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search plugin file",
  },
  --
  -- LazyVim
  --
  {
    "<leader>yl",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim",
        search_dirs = vim.v.count > 0 and {
          vim.fn.stdpath("data") .. "/lazy/LazyVim",
          vim.fn.stdpath("config"),
        },
      })
    end,
    desc = "Find LazyVim file",
  },
  {
    "<leader>yL",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim",
        search_dirs = vim.v.count > 0 and {
          vim.fn.stdpath("data") .. "/lazy/LazyVim",
          vim.fn.stdpath("config"),
        },
      })
    end,
    desc = "Search LazyVim file",
  },
  {
    mode = "x",
    "<leader>yl",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find LazyVim file",
  },
  {
    mode = "x",
    "<leader>yL",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search LazyVim file",
  },
  --
  -- AstroNvim
  --
  {
    "<leader>yk",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("data") .. "/lazy/AstroNvim",
        search_dirs = vim.v.count > 0 and {
          vim.fn.stdpath("data") .. "/lazy/AstroNvim",
          vim.fn.stdpath("config"),
        },
      })
    end,
    desc = "Find AstroNvim file",
  },
  {
    "<leader>yk",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("data") .. "/lazy/AstroNvim",
        search_dirs = vim.v.count > 0 and {
          vim.fn.stdpath("data") .. "/lazy/AstroNvim",
          vim.fn.stdpath("config"),
        },
      })
    end,
    desc = "Search AstroNvim file",
  },
  {
    mode = "x",
    "<leader>yk",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("data") .. "/lazy/AstroNvim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find AstroNvim file",
  },
  {
    mode = "x",
    "<leader>yK",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.fn.stdpath("data") .. "/lazy/AstroNvim",
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search AstroNvim file",
  },
  --
  -- vim runtime
  --
  {
    "<leader>yv",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.env.VIMRUNTIME,
      })
    end,
    desc = "Find vim runtime file",
  },
  {
    "<leader>yV",
    function()
      require("telescope.builtin").live_grep({
        cwd = vim.env.VIMRUNTIME,
      })
    end,
    desc = "Search vim runtime file",
  },
  {
    mode = "x",
    "<leader>yv",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").find_files({
        cwd = vim.env.VIMRUNTIME,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Find vim runtime file",
  },
  {
    mode = "x",
    "<leader>yV",
    function()
      local text = U.get_visual_selection()
      require("telescope.builtin").live_grep({
        cwd = vim.env.VIMRUNTIME,
      })
      vim.fn.feedkeys(text)
    end,
    desc = "Search vim runtime file",
  },
  -- [Advanced telescope.nvim Examples] by TJ DeVries
  -- @see https://www.youtube.com/watch?v=xdXE1tOT-qg
  {
    "<leader>sl",
    function()
      require("plugins.telescope.pickers").glob_grep()
    end,
    desc = "Glob grep",
  },
}
