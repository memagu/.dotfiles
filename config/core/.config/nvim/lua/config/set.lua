vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.updatetime = 165

vim.opt.listchars:append({ space = "·", tab = "⭲ ", eol = "↲" })
vim.opt.list = false

vim.opt.isfname:append("@")
