return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    -- When switching buffers, collapse all folders then reveal the current file
    vim.api.nvim_create_autocmd("BufWinEnter", {
      callback = function()
        vim.schedule(function()
          local ok, api = pcall(require, "nvim-tree.api")
          if not ok then return end
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname == "" or vim.bo.filetype == "NvimTree" then return end
          if api.tree.is_visible() then
            api.tree.collapse_all()
            api.tree.find_file({ open = false, focus = false })
            vim.cmd("NvimTreeResize 30")
          end
        end)
      end,
    })
  end,
}
