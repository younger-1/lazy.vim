if vim.loader then
  vim.loader.enable()
end

vim.env.LAZYVIM_DIR = vim.fn.stdpath("data") .. "/lazy/lazyvim"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
