vim.g.airline_extensions_whitespace_enabled = 0
vim.g.airline_extensions_whitespace_checks = {}
vim.g.airline_extensions_whitespace_mixed_indent_algo = 2
vim.g.airline_section_warning = "" -- this actually works

vim.g.airline_powerline_fonts = 1
vim.g.mapleader = ' '
vim.g.tmux_navigator_verbose = 1
vim.o.autoindent = true
vim.o.clipboard = "unnamed"
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shell = '/bin/zsh'
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.syntax = 'on'
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.wrap = true

vim.diagnostic.config({
	update_in_insert = true,
	signs = true,
	underline = true,
})
