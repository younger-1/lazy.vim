return {
  {
    "nvim-cmp",
    dependencies = "lukas-reineke/cmp-rg",
    ---@module 'cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cfg = {
        name = "buffer",
        option = {
          get_bufnrs = function()
            -- filter big buffers
            -- local buf = vim.api.nvim_get_current_buf()
            -- local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
            -- if byte_size > 1024 * 1024 then -- 1 Megabyte max
            --   return {}
            -- end

            -- only visible buffers
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      }
      for i, v in pairs(opts.sources) do
        if v.name == "buffer" then
          opts.sources[i] = cfg
          break
        end
      end
    end,
  },
}
