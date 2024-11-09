vim.loader.enable()

vim.env.LAZYVIM_DIR = vim.fn.stdpath("data") .. "/lazy/lazyvim"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("modules")
require("config.lazy")
