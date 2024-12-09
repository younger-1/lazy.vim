---@type LazySpec
return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          if vim.v.count == 0 then
            require("grug-far").open({
              staticTitle = "Search and Replace",
              prefills = {
                search = vim.fn.expand("<cword>"),
                filesFilter = ext and ext ~= "" and "*." .. ext or nil,
              },
            })
            return
          end
          require("grug-far").toggle_instance({
            instanceName = "my_grug_far_" .. vim.v.count,
            prefills = {
              search = vim.fn.expand("<cword>"),
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
      {
        "<leader>sR",
        function()
          require("grug-far").open({
            prefills = {
              search = vim.fn.expand("<cword>"),
              paths = vim.fn.expand("%"),
            },
          })
        end,
        mode = { "n", "x" },
        desc = "Search and Replace (buf)",
      },
    },
    config = function(_, opts)
      require("grug-far").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("_grug_far", { clear = true }),
        pattern = { "grug-far" },
        callback = function(event)
          vim.schedule(function() -- NOTE: override lazyvim
            -- show buf in buffer list
            vim.bo[event.buf].buflisted = true

            -- hide buffer to keep instance alive
            vim.keymap.set("n", "q", function()
              vim.cmd("try | close | catch /E444/ | e#")
            end, { buffer = event.buf, desc = "Hide buffer" })
          end)

          vim.keymap.set("n", "<localleader>F", function()
            local state = unpack(require("grug-far").toggle_flags({ "--fixed-strings" }))
            vim.notify("grug-far: toggled --fixed-strings " .. (state and "ON" or "OFF"))
          end, { buffer = true, desc = "Toggle fixed-strings" })
          vim.keymap.set("n", "<localleader><localleader>", function()
            vim.api.nvim_win_set_cursor(vim.fn.bufwinid(0), { 2, 0 })
          end, { buffer = true, desc = "Jump to search input" })
        end,
      })
    end,
  },
  {
    "echasnovski/mini.files",
    optional = true,
    opts = function(_, opts)
      local files_grug_far_replace = function(path)
        -- works only if cursor is on the valid file system entry
        local cur_entry_path = require("mini.files").get_fs_entry().path
        local prefills = { paths = vim.fs.dirname(cur_entry_path) }

        local grug_far = require("grug-far")

        -- instance check
        if not grug_far.has_instance("explorer") then
          grug_far.open({
            instanceName = "explorer",
            prefills = prefills,
            staticTitle = "Find and Replace from Explorer",
          })
        else
          grug_far.open_instance("explorer")
          -- updating the prefills without crealing the search and other fields
          grug_far.update_instance_prefills("explorer", prefills, false)
        end
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "gs", files_grug_far_replace, { buffer = args.data.buf_id, desc = "[xy] GrugFar dir" })
        end,
      })

      return opts
    end,
  },
}
