local theme = require("global.theme.config")
local colors, highligh, link = theme.colors, theme.highlight, theme.link

highligh("NoiceCmdlinePopupBorder", colors.green)
link("NoiceCmdlineIconLua", "NoiceCmdlinePopupBorder")
link("NoiceCmdlineIcon", "NoiceCmdlineIconLua")
link("NoiceConfirmBorder", "DarkGreen")
link("NoiceFormatLevelInfo", "DarkGreen")
