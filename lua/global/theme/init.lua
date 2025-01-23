vim.o.background = "dark"


---Require all files in the current directory manualy
local function require_all_modules()
	require("global.theme.pmenu")
	require("global.theme.treesitter")
	require("global.theme.telescope")
	require("global.theme.cmp")
end

-- Uncomment to include all modules manualy
-- require_all_modules()


---Require all files in the given directory, except for `init.lua`
---@param dir string
local function require_all_modules_automaticaly(dir)
	local files = vim.fn.globpath(dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t")
		local module_name = filename:gsub("%.lua$", "")

		-- Ignore the `init.lua` file as a entry point, and `config.lua` for configuration proposes
		if module_name ~= "init" and module_name ~= "config"  then
			local require_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".") .. "." .. module_name
			require(require_path)
			-- pcall(require, require_path)
		end
	end
end


local theme_config = require("global.theme.config")
local colors, highlight, link = theme_config.colors , theme_config.highlight, theme_config.link

-- Define basic colors for general usage
highlight("Comment", colors.comment, colors.bg)
highlight("Conditional", colors.purple)
highlight("Constant", colors.blue)
highlight("CurSearch", colors.darkgreen, colors.green)
highlight("Cursor", colors.fg, colors.bg)
highlight("DarkBlue", colors.darkblue)
highlight("DarkBlue", colors.darkblue)
highlight("DarkGreen", colors.darkgreen)
highlight("Define", colors.green)
highlight("Function", colors.yellow)
highlight("Green", colors.green)
highlight("Identifier", colors.lightblue)
highlight("Include", colors.green)
highlight("Keyword", colors.purple)
highlight("Lightblue", colors.lightblue)
highlight("Macro", colors.green)
highlight("Normal", colors.fg, colors.bg)
highlight("Number", colors.green)
highlight("Red", colors.red)
highlight("Search", colors.fg, colors.search)
highlight("Special", colors.green)
highlight("Statement", colors.purple)
highlight("StatusLineNC", colors.comment, colors.bg)
highlight("String", colors.orange)
highlight("String.special", colors.darkorange)
highlight("Type", colors.emerald)
highlight("Typedef", colors.green)
highlight("Variable", colors.lightblue)
highlight("Visual", colors.fg, colors.visual)
highlight("White", colors.white)

-- Require all modules in the current dir auromaticaly
require_all_modules_automaticaly(vim.fn.stdpath('config') .. '/lua/global/theme')
