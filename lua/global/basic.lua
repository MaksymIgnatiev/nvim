vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
-- vim.o.shell = '/bin/zsh'
vim.opt.clipboard:append('unnamedplus')
vim.cmd("syntax on")
vim.g.mapleader = ' '
vim.g.airline_powerline_fonts = 1
vim.o.termguicolors = true
vim.opt.signcolumn = "yes"


vim.cmd [[
  highlight GitGutterAdd guifg=#00FF00 guibg=NONE
  highlight GitGutterChange guifg=#FFFF00 guibg=NONE
  highlight GitGutterDelete guifg=#FF0000 guibg=NONE
]]


vim.diagnostic.config({
    update_in_insert = true, -- update the lsp server in insert mode
    -- virtual_text = false,    -- Disable virtual text
    signs = true,            -- Keep signs in the sign column
    underline = true,        -- Underline diagnostics in the text
})
