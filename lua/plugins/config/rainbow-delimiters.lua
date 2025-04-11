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
highlight("RainbowDelimiterYellow", "#CCCC00")
highlight("RainbowDelimiterOrange", "#FFA500")
highlight("RainbowDelimiterBlue", "#0000DD")
highlight("RainbowDelimiterCyan", "#00CCCC")
