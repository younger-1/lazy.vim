LAZY_PLUGIN_SPEC = {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.editor.illuminate" },
  { import = "lazyvim.plugins.extras.editor.outline" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.java" },
  { import = "lazyvim.plugins.extras.lang.zig" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.util.dot" },
}

local function spec(item)
  if type(item) == "string" then
    table.insert(LAZY_PLUGIN_SPEC, { import = "plugins." .. item })
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
      "flash",
      -- move by subwords and skip insignificant punctuation.
      "spider",
    },
    change = {
      "visual-surround",
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
  },
  appearance = {
    highlight = {
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
      "mini.indentscope",
      -- "hlchunk",
    },
    cursor = {
      -- "mini.animate",
      "smear-cursor",
      -- "neoscroll",
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
    jump = {
      {
        "pechorin/any-jump.vim",
        cmd = { "AnyJump", "AnyJumpVisual", "AnyJumpArg" },
        keys = {
          { "go", ":AnyJump<cr>" },
          { "go", ":AnyJumpVisual<cr>", mode = "x" },
          { "gob", ":AnyJumpBack<cr>" },
          { "gol", ":AnyJumpLastResults<cr>" },
        },
        init = function()
          vim.g.any_jump_disable_default_keybindings = 1
        end,
      },
    },
  },
  lang = {
    go = true,
    markdown = true,
    ziggy = true,
    json = {
      "sortjson",
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
    },
    diff = {
      "linediff",
    },
    search = {
      "telescope",
      -- search and replace in multiple file
      "grug-far",
      -- search and replace in current buffer
      -- "rip-substitute",
    },
    keymap = {
      "which-key",
      "screenkey",
    },
    icon = {
      "icon-picker",
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
