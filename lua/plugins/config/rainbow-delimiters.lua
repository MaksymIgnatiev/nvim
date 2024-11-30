local rainbow_delimiters = require("rainbow-delimiters")

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

vim.cmd([[
	highlight RainbowDelimiterGreen guifg=#0F0
	highlight RainbowDelimiterYellow guifg=#FF0
	highlight RainbowDelimiterOrange guifg=#FFA500
	highlight RainbowDelimiterBlue guifg=#00F
	highlight RainbowDelimiterCyan guifg=#00CCCC
]])
