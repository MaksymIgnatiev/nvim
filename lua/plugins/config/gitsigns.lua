-- ~/.config/nvim/lua/plugins/config/gitsigns.lua

-- Setup Gitsigns with custom highlights
require('gitsigns').setup {
  -- signs = {
    -- add          = {hl = 'GitSignsAdd',    text = '+', numhl='GitSignsAddNr',    linehl='GitSignsAddLn'},
    -- change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    -- delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    -- topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    -- changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  -- },
  -- Additional configurations can be added here
}

-- Define highlight groups for Gitsigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#00FF00', bg = 'NONE', text = '+' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#FFFF00', bg = 'NONE', text = '~' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF0000', bg = 'NONE', text = '_' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = '#00FF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = '#FFFF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = '#FF0000', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { bg = '#003300' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { bg = '#333300' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { bg = '#330000' })

