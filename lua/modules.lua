LAZY_PLUGIN_SPEC = {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.editor.illuminate" },
  { import = "lazyvim.plugins.extras.editor.outline" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.toml" },
}

local function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

-- spec("plugins.lazyvim")
-- spec("plugins.bufferline")
-- spec("plugins.colorscheme")

---@alias module table
local all = {
  editor = {
    core = {
      "lazyvim",
      "snacks",
      "colorscheme",
    },
    motion = {
      "matchup",
      "flash",
    },
    project = {
      "project",
      "telescope-project",
    },
    session = {
      "persistence",
    },
  },
  ui = {
    statusline = {
      "lualine",
    },
    bufferline = {
      "bufferline",
    },
    winbar = {
      "dropbar",
      "navic",
    },
    cmdline = {
      "noice",
    },
    buffer = {
      -- work with familiar project
      "harpoon",
      -- explore with new project
      "snipe",
    },
    file = {
      "mini.files",
    },
  },
  appearance = {
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
      "mini.indentscope",
      -- "hlchunk",
    },
  },
  coding = {
    lsp = {
      "lspconfig",
      "trouble",
    },
    treesitter = {
      "treesj",
      -- "treesitter.refactor",
    },
  },
  lang = {
    go = true,
    markdown = true,
    json = {
      "sortjson",
    },
  },
  tool = {
    git = {
      "gitsigns",
    },
    search = {
      "telescope",
    },
  },
}

for topic, modules in pairs(all) do
  for mod_name, plugs in pairs(modules) do
    if type(plugs) == "boolean" and plugs == true then
      spec("plugins." .. topic .. "." .. mod_name)
    end
    if type(plugs) == "table" and vim.islist(plugs) then
      for _, plug in ipairs(plugs) do
        spec("plugins." .. plug)
      end
    end
  end
end
