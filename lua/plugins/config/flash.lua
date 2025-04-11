local theme = require("global.theme.config")
local highlight = theme.highlight

local flash_main_color =  "#006400"

highlight("FlashBackdrop", "#808080")
highlight("FlashLabel", nil, flash_main_color)
highlight("FlashMatch", flash_main_color, "#00FF00")
-- highlight("FlashCurrent", nil, flash_main_color)

require('flash').setup({
	highlight = {
		backdrop = true,
		groups = {
			match = "FlashMatch",
			current = "FlashCurrent",
			backdrop = "FlashBackdrop",
			label = "FlashLabel"
		},
	},
	modes = {
		search = {
			highlight = { backdrop = true },
		},
	},
})
