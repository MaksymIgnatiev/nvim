local colors = {
	bg = "#0a110a",
	fg = "#99ee99",
	green = "#55cc55",
	dark_green = "#115511",
	comment = "#337733",
	yellow = "#dddd44",
	blue = "#0077ff",
	lightblue = "#00aaff",
	purple = "#aa44aa",
	magenta = "#dd22cc",
	cyan = "#00ddff",
	white = "#eeffee",
	black = "#000000",
	emerald = "#00cc66",
	orange = "#dd8844",
	lightorange = "#a74700",
	darkblue = "#0077cc",
	red = "#bb4444",
	cursor_line = "#225522",
	visual = "#336633",
	search = "#114411",
}

vim.o.background = "dark"


---Highlight the given group with the given colors
---@param group string group to highlight
---@param guifg string foregronund for group
---@param guibg string|nil background for group
---@param gui any
local highlight = function(group, guifg, guibg, gui)
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui or "NONE"))
end


highlight("Comment", colors.comment, colors.bg)
highlight("Conditional", colors.purple)
highlight("Constant", colors.blue)
highlight("Cursor", colors.fg, colors.bg)
highlight("CurSearch", colors.dark_green, colors.green)
highlight("Define", colors.green)
highlight("Function", colors.yellow)
highlight("Identifier", colors.lightblue)
highlight("Include", colors.green)
highlight("Keyword", colors.purple)
highlight("Macro", colors.green)
highlight("Normal", colors.fg, colors.bg)
highlight("Number", colors.green)
highlight("Search", colors.fg, colors.search)
highlight("Statement", colors.purple)
highlight("StatusLineNC", colors.comment, colors.bg)
highlight("String", colors.orange)
highlight("Type", colors.green)
highlight("Typedef", colors.green)
highlight("Visual", colors.fg, colors.visual)


highlight("@attribute.builtin", colors.red)
highlight("@character.special", colors.blue)
highlight("@constant.builtin", colors.blue)
highlight("@constant", colors.blue)
highlight("@constructor", colors.blue)
highlight("@function.arrow", colors.blue)
highlight("@function.builtin", colors.yellow)
highlight("@function", colors.yellow)
highlight("@keyword", colors.darkblue)
highlight("@keyword.conditional", colors.purple)
-- highlight("@keyword.exception", colors.purple)
-- highlight("@keyword.export", colors.purple)
highlight("@keyword.import", colors.purple)
highlight("@keyword.return", colors.purple)
highlight("@lsp.type.regexp", colors.red)
highlight("@method", colors.yellow)
highlight("@module.builtin", colors.blue)
highlight("@punctuation", colors.white)
highlight("@punctuation.special", colors.white)
highlight("@string", colors.orange)
highlight("@string.escape", colors.lightorange)
highlight("@string.regexp", colors.red)
highlight("@string.special", colors.lightorange)
highlight("@tag.builtin", colors.red)
highlight("@tag", colors.red)
-- highlight("@type.builtin", colors.emerald)
-- highlight("@type", colors.emerald)
highlight("@variable.builtin", colors.green)
highlight("@variable", colors.lightblue)
highlight("@variable.parameter", colors.green)
