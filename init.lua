vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Init Options
require("config.options")

-- Init LazyNVIM
require("config.lazy")

-- Set the colorscheme
vim.cmd[[colorscheme matrix]]

-- Make the background transparent
local transparent_group = vim.api.nvim_create_augroup('TransparentBG', { clear = true })

-- This creates an autocommand that runs whenever a colorscheme is loaded
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*', -- Run for every colorscheme
  group = transparent_group,
  callback = function()
    -- Set the Normal highlight group to have no background
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- Do the same for floating windows, like hover docs
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
})

vim.g.neovide_transparency = 0.8
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.opt.splitright = true

-- nvim-tree reqs
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.o.exrc = true

-- Open a new terminal at the far right of the screen
vim.keymap.set('n', '<leader>t', function()
  -- 1. Create the vertical split at the absolute far right
  vim.cmd("botright vsplit")
  
  -- 2. Start the terminal
  vim.cmd("terminal")
  
  -- 3. (Optional but recommended) Automatically enter Insert mode 
  -- so you can start typing commands immediately
  vim.cmd("startinsert")
end, { desc = "Terminal (Far Right)" })

-- Automatically expand %% to the current file's directory in the command line
vim.keymap.set('c', '%%', function()
  if vim.fn.getcmdtype() == ':' then
    return vim.fn.expand('%:h') .. '/'
  else
    return '%%'
  end
end, { expr = true, desc = "Expand %% to current dir" })

-- 1. Intercept quit commands when focused on the File Tree
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    -- If the current window we are trying to quit is NvimTree...
    if vim.bo.filetype == "NvimTree" then
      -- ...upgrade the command to quit ALL windows instead.
      -- Neovim will still safely warn you if you have unsaved changes in your main editor.
      vim.cmd("qa")
    end
  end,
})


