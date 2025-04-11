-- ~/.config/nvim/lua/plugins/config/gitsigns.lua

local theme = require("global.theme.config")
local highlight = theme.highlight


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
highlight('GitSignsAdd', '#00FF00',nil,  { text = '+' })
highlight('GitSignsChange', '#FFFF00', nil,{ text = '~' })
highlight('GitSignsDelete', '#FF0000', nil,{ text = '_' })
highlight('GitSignsAddNr', '#00FF00')
highlight('GitSignsChangeNr', '#FFFF00')
highlight('GitSignsDeleteNr', '#FF0000')
highlight('GitSignsAddLn', nil, '#003300')
highlight('GitSignsChangeLn', nil, '#333300')
highlight('GitSignsDeleteLn', nil, '#330000')

