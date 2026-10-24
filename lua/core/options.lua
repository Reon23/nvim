vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

vim.opt.termguicolors = true

-- Use system clipboard as default
vim.opt.clipboard = "unnamedplus"

-- Hide command line
vim.opt.cmdheight = 0

vim.opt.cmdheight = 0
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.wo.signcolumn = "yes"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true

vim.o.swapfile = false

vim.o.smartindent = true

vim.o.undofile = true
vim.opt.runtimepath:append(vim.fn.stdpath "data" .. "/site")
