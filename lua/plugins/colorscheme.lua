-- File: ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  "iruzo/matrix-nvim",
  lazy = false,    -- Make sure this plugin loads at startup
  priority = 1000, -- Make sure it loads before other plugins

  config = function()
    -- This code runs AFTER the plugin is loaded

    -- 1. Set the colorscheme
    vim.cmd.colorscheme("matrix")

    -- 2. Set the background to transparent
    -- We put this here to make sure it runs after the colorscheme is set
    local transparent_group = vim.api.nvim_create_augroup('TransparentBG', { clear = true })
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      group = transparent_group,
      callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      end,
    })
  end,
}
