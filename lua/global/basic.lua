vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.shell = '/bin/zsh'
vim.o.syntax = 'on'
vim.g.mapleader = ' '
vim.g.airline_powerline_fonts = 1
vim.o.termguicolors = true
vim.opt.signcolumn = "yes"
vim.g.tmux_navigator_verbose = 1
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.o.wrap = true
vim.opt.clipboard = "unnamedplus"

vim.cmd [[
  highlight GitGutterAdd guifg=#00FF00 guibg=NONE
  highlight GitGutterChange guifg=#FFFF00 guibg=NONE
  highlight GitGutterDelete guifg=#FF0000 guibg=NONE
]]

vim.diagnostic.config({
    update_in_insert = true,
    signs = true,
    underline = true,
})
