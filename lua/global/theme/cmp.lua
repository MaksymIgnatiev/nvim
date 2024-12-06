-- Custom colors for flash

local theme = require("global.theme")
local colors, highlight, link = theme.colors, theme.highlight, theme.link

highlight("CmpItemAbbrMatch", colors.fg, colors.search)
link("CmpItemMenu", "Green")
link("CmpItemKindKeyword", "Keyword")
link("CmpItemKindVariable", "Lightblue")
link("CmpItemKindFunction", "Function")
link("CmpItemKindMethod", "Function")
link("CmpItemKindField", "Lightblue")
link("CmpItemKindClass", "Type")
link("CmpItemKindEnum", "Type")
link("CmpItemKindInterface", "Type")
link("CmpItemAbbr", "Green")
link("CmpItemKindText", "White")
