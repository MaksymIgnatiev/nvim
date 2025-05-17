local rainbow_delimiters = require("rainbow-delimiters")
local theme = require("global.theme.config")
local highlight  = theme.highlight

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
	},
	highlight = {
		"RainbowDelimiterGreen",
		"RainbowDelimiterYellow",
		"RainbowDelimiterOrange",
		"RainbowDelimiterBlue",
		"RainbowDelimiterCyan",
	},
}

highlight("RainbowDelimiterGreen", "#00AA00")
highlight("RainbowDelimiterYellow", "#CCDD00")
highlight("RainbowDelimiterOrange", "#FFAA00")
highlight("RainbowDelimiterBlue", "#4444FF")
highlight("RainbowDelimiterCyan", "#00CCCC")
