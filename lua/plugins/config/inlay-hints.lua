local theme = require("global.theme.config")
local highlight = theme.highlight

require("inlay-hints").setup({
	commands = { enable = true },
	autocmd = { enable = true },
})


highlight("LspInlayHint", "#777777")
