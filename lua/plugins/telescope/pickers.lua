local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

function M.glob_grep(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or LazyVim.root()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ") -- NOTE: magic here
      -- { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
      local args = vim.deepcopy(conf.vimgrep_arguments)
      -- -e PATTERN, --regexp=PATTERN
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end
      -- -g GLOB, --glob=GLOB
      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return args
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 200,
      prompt_title = "Grep with glob (e.g. xxx  *.lua)",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end

return M
