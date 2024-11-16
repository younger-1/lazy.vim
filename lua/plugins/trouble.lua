return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      local function xy_send_to_trouble(prompt_bufnr)
        require("trouble.sources.telescope").open(prompt_bufnr)
      end
      local function xy_add_to_trouble(prompt_bufnr)
        require("trouble.sources.telescope").add(prompt_bufnr) -- Use this to add more results without clearing the trouble list
      end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-t>"] = xy_send_to_trouble,
            ["<c-t>"] = xy_send_to_trouble,
            ["<A-t>"] = xy_add_to_trouble,
            ["<a-t>"] = xy_add_to_trouble,
          },
        },
      })
    end,
  },
}
