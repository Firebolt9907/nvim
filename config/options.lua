vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.opt.relativenumber = false -- Show relative line numbers
vim.opt.number = true -- Show absolute line numbers 
vim.opt.scrolloff = 6       -- Keep 4 lines of context around the cursor
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.opt.signcolumn = "no"
