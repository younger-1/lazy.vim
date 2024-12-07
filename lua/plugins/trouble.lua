return {
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function(_, opts)
      local function my_send_to_trouble(prompt_bufnr)
        require("trouble.sources.telescope").open(prompt_bufnr)
      end
      local function my_add_to_trouble(prompt_bufnr)
        require("trouble.sources.telescope").add(prompt_bufnr) -- Use this to add more results without clearing the trouble list
      end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-t>"] = my_send_to_trouble,
            ["<c-t>"] = my_send_to_trouble,
            ["<A-t>"] = my_add_to_trouble,
            ["<a-t>"] = my_add_to_trouble,
          },
        },
      })
    end,
  },
}
