LAZY_PLUGIN_SPEC = {}

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
      "colorscheme",
    },
    buffer = {
      "harpoon",
      "snipe",
    },
  },
  ui = {
    bufferline = {
      "bufferline",
    },
    winbar = {
      "dropbar",
      "navic",
    },
    window = {
      "winsep",
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
  },
  lang = {
    lsp = {
      "lspconfig",
      "trouble",
    },
    treesitter = {
      "treesitter",
      "treesj",
    },
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
    for i, plug in ipairs(plugs) do
      spec("plugins." .. plug)
    end
  end
end
