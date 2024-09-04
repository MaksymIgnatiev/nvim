local vim = vim

vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.shell = '/bin/zsh'
vim.opt.clipboard:append('unnamedplus')
vim.cmd("syntax on")
vim.cmd('colorscheme wildcharm')
vim.g.mapleader = ' '
vim.g.airline_powerline_fonts = 1

vim.cmd [[
  highlight GitGutterAdd guifg=#00FF00 guibg=NONE
  highlight GitGutterChange guifg=#FFFF00 guibg=NONE
  highlight GitGutterDelete guifg=#FF0000 guibg=NONE
]]



