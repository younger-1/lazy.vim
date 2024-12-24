LAZY_PLUGIN_SPEC = {
  { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
  { import = "lazyvim.plugins.extras.editor.telescope" },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.editor.outline" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.zig" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.util.dot" },
}

local function spec(item)
  if type(item) == "string" then
    -- table.insert(LAZY_PLUGIN_SPEC, { import = "plugins." .. item })
    table.insert(LAZY_PLUGIN_SPEC, require("plugins." .. item))
  elseif type(item) == "table" then
    table.insert(LAZY_PLUGIN_SPEC, item)
  end
end

---@type table<string, table<string, (string|LazyPluginSpec|LazySpecImport)[]|boolean>>
local all = {
  editor = {
    core = {
      "lazyvim",
      "snacks",
      "colorscheme",
    },
    motion = {
      "matchup",
      -- "tabtree",
      -- "tabout",
      "backout",
      "flash",
      -- move by subwords and skip insignificant punctuation.
      "spider",
      -- "easyword",
    },
    change = {
      "visual-surround",
      -- text case
      "coerce",
    },
    project = {
      "project",
      "telescope-project",
    },
    session = {
      "persistence",
    },
    option = {
      "guess-indent",
      -- "dansa",
      -- "toggle",
    },
  },
  ui = {
    statusline = {
      "lualine",
    },
    tabline = {
      "bufferline",
      -- "buffertabs",
    },
    winbar = {
      "dropbar",
      "navic",
    },
    cmdline = {
      "noice",
    },
    buffer = {
      -- auto close
      "early-retire",
      -- work with familiar project
      "harpoon",
      -- explore with new project
      "snipe",
    },
    file = {
      "neo-tree",
      "mini.files",
    },
    screen = {
      -- "dashboard",
      "snacks.dashboard",
    },
    menu = {
      "menu",
    },
  },
  appearance = {
    highlight = {
      "illuminate",
      "paint",
    },
    dim = {
      -- "tint",
      -- "vimade",
      "twilight",
    },
    zen = {
      "zen-mode",
    },
    window = {
      "winsep",
    },
    indent = {
      -- "mini.indentscope",
      -- "hlchunk",
    },
    cursor = {
      -- "mini.animate",
      "smear-cursor",
      -- "neoscroll",
    },
  },
  code = {
    lsp = {
      "lspconfig",
      "trouble",
    },
    treesitter = {
      "treesj",
      -- "treesitter-refactor",
    },
    browsing = {
      "any-jump",
    },
    completion = {
      "cmp-buffer",
      "cmp-cmdline",
      "cmp-rg",
    },
    debug = {
      "debugprint",
    },
  },
  lang = {
    lua = true,
    go = true,
    markdown = true,
    ziggy = true,
    json = {
      "sortjson",
    },
    help = {
      "helpview",
    },
  },
  tool = {
    git = {
      "gitsigns",
      "blame",
      "gitgraph",
      "diffview",
      "neogit",
      "flog",
      "fugit2",
      "tinygit",
      -- "gitlinker",
      "gitportal",
    },
    diff = {
      "linediff",
    },
    undo = {
      "undotree",
      "telescope-undo",
      "fundo",
    },
    search = {
      -- search and replace in multiple file
      "grug-far",
      -- search and replace in current buffer
      -- "rip-substitute",
      "deck",
    },
    telescope = {
      "telescope",
      "telescope-lazy",
      "telescope-symbols",
      "telescope-env",
      "easypick",
      "smart-open",
      "telescope-frecency",
      -- plugin installation system
      "activate",
    },
    keymap = {
      "which-key",
      "screenkey",
    },
    icon = {
      "icon-picker",
    },
    nvzone = {
      "nvzone",
    },
    spell = {
      "dirty-talk",
    },
  },
}

for topic, modules in pairs(all) do
  for mod_name, plugs in pairs(modules) do
    if type(plugs) == "boolean" and plugs then
      spec(topic .. "." .. mod_name)
    end
    if type(plugs) == "table" and vim.islist(plugs) then
      for _, plug in ipairs(plugs) do
        spec(plug)
      end
    end
  end
end
