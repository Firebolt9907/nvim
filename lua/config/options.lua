vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.opt.relativenumber = false -- Show absolute line numbers
vim.opt.number = true
vim.opt.scrolloff = 4       -- Keep 8 lines of context around the cursor
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.o.signcolumn = "no"
vim.o.foldcolumn = "0"

vim.opt.colorcolumn = "80"
