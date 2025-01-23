-- Custom colors for Pmenu

local theme = require("global.theme.config")
local colors, highlight, link  = theme.colors, theme.highlight, theme.link

highlight("Pmenu", colors.fg, colors.almostblackgreen)
highlight("PmenuSel", colors.fg, colors.darkgreen)
highlight("PmenuSbar", nil, colors.ultradarkgreen)
highlight("PmenuThumb", nil, colors.darkgreen)

link("NormalFloat", "Pmenu")
