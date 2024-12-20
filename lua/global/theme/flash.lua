-- Custom colors for flash

local theme = require("global.theme")
local colors, highlight, link = theme.colors, theme.highlight, theme.link

link("FlashPromptIcon", "String")
highlight("FlashBackdrop", "#808080")
highlight("FlashMatch", colors.cursor_line, "#00FF00")
highlight("FlashLabel", nil, colors.cursor_line)
-- highlight( "FlashCurrent", colors.cursor_line)
