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

highlight("RainbowDelimiterGreen", "#0F0")
highlight("RainbowDelimiterYellow", "#FF0")
highlight("RainbowDelimiterOrange", "#FFA500")
highlight("RainbowDelimiterBlue", "#00F")
highlight("RainbowDelimiterCyan", "#00CCCC")
