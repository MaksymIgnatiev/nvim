-- Custom colors for telescope

local theme = require("global.theme.config")
local colors, highlight, link = theme.colors, theme.highlight, theme.link


highlight("TelescopeMatching", colors.fg, colors.search)
link("TelescopeTitle", "Green")
link("TelescopeBorder", "Green")
link("TelescopeSelection", "Search")
link("TelescopePromptPrefix", "Green")
link("TelescopePromptCounter", "DarkGreen")
