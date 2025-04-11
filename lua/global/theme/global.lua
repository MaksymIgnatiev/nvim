local theme = require("global.theme.config")
local highlight, link = theme.highlight, theme.link

link("DiagnosticUnnecessary", "LspInlayHint")
highlight("GitGutterAdd", "#00FF00")
highlight("GitGutterChange", "#FFFF00")
highlight("GitGutterDelete", "#FF0000")
