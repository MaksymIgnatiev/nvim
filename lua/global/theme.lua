local colors = {
	bg = "#001100",
	fg = "#99ee99",
	green = "#55cc55",
	darkgreen = "#115511",
	ultradarkgreen = "#003300",
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
	darkorange = "#a74700",
	darkblue = "#0077cc",
	red = "#bb4444",
	cursor_line = "#225522",
	visual = "#336633",
	search = "#114411",
}

vim.o.background = "dark"


---Highlight the given group with the given colors for foregronund, background, and other GUI features
---@param group string group to highlight
---@param guifg string|nil foregronund for group
---@param guibg string|nil background for group
---@param gui any
local function highlight(group, guifg, guibg, gui)
	vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui or "NONE"))
end

---Link one highlight group to another
---@param from_group string
---@param to_group string
local function link(from_group, to_group)
	if not from_group or not to_group then
		error("Both 'from_group' and 'to_group' must be specified")
	end
	vim.api.nvim_set_hl(0, from_group, { link = to_group })
end


-- Define
highlight("Comment", colors.comment, colors.bg)
highlight("Conditional", colors.purple)
highlight("Constant", colors.blue)
highlight("CurSearch", colors.darkgreen, colors.green)
highlight("Cursor", colors.fg, colors.bg)
highlight("DarkBlue", colors.darkblue)
highlight("DarkBlue", colors.darkblue)
highlight("Define", colors.green)
highlight("Function", colors.yellow)
highlight("Green", colors.green)
highlight("DarkGreen", colors.darkgreen)
highlight("Identifier", colors.lightblue)
highlight("Include", colors.green)
highlight("Keyword", colors.purple)
highlight("Lightblue", colors.lightblue)
highlight("Macro", colors.green)
highlight("Normal", colors.fg, colors.bg)
highlight("Number", colors.green)
highlight("Red", colors.red)
highlight("Search", colors.fg, colors.search)
highlight("Statement", colors.purple)
highlight("StatusLineNC", colors.comment, colors.bg)
highlight("String", colors.orange)
highlight("String.special", colors.darkorange)
highlight("Type", colors.emerald)
highlight("Typedef", colors.green)
highlight("Variable", colors.lightblue)
highlight("Visual", colors.fg, colors.visual)
highlight("White", colors.white)


-- Link and Rebind

-- Pmenu (app popup windows)
highlight("Pmenu", colors.fg, colors.bg)
highlight("PmenuSel", colors.fg, colors.darkgreen)
highlight("PmenuSbar", nil , colors.ultradarkgreen)
highlight("PmenuThumb", nil, colors.darkgreen)

-- Treesitter
link("@attribute.builtin"          , "Red"            )
link("@character.special"          , "Constant"       )
link("@constant.builtin"           , "Constant"       )
link("@constant"                   , "Constant"       )
link("@constructor"                , "Constant"       )
link("@function.arrow"             , "Constant"       )
link("@function.builtin"           , "Function"       )
link("@function"                   , "Function"       )
link("@keyword.conditional"        , "Conditional"    )
link("@keyword"                    , "DarkBlue"       )
link("@keyword.exception"          , "Conditional"    )
link("@keyword.export"             , "Conditional"    )
link("@keyword.import"             , "Conditional"    )
link("@keyword.return"             , "Conditional"    )
link("@local.definition.parameter" , "Red"            )
link("@method"                     , "Function"       )
link("@module.builtin"             , "Constant"       )
link("@punctuation.special"        , "White"          )
link("@punctuation"                , "White"          )
link("@string.escape"              , "String.special" )
link("@string.regexp"              , "Red"            )
link("@string.special"             , "String.special" )
link("@string"                     , "String"         )
link("@tag.builtin"                , "Red"            )
link("@tag"                        , "Red"            )
link("@type.builtin"               , "Type"           )
link("@type"                       , "Type"           )
link("@variable.builtin"           , "Type"           )
link("@variable.parameter.builtin" , "Green"          )
link("@variable.parameter"         , "Green"          )
link("@variable"                   , "Variable"       )

-- Flash
link("FlashPromptIcon", "String")

-- Telescope
highlight("TelescopeMatching", colors.fg, colors.search)
link("TelescopeTitle", "Green")
link("TelescopeBorder", "Green")
link("TelescopeSelection", "Search")
link("TelescopePromptPrefix", "Green")
link("TelescopePromptCounter", "DarkGreen")

-- Cmp
highlight("CmpItemAbbrMatch", colors.fg, colors.search)
link("CmpItemMenu", "Green")
link("CmpItemKindKeyword", "Keyword")
link("CmpItemKindVariable", "Lightblue")
link("CmpItemKindFunction", "Function")
link("CmpItemKindMethod", "Function")
link("CmpItemKindField", "Lightblue")
link("CmpItemKindClass", "Type")
link("CmpItemKindEnum", "Type")
link("CmpItemKindInterface", "Type")
link("CmpItemAbbr", "Green")
link("CmpItemKindText", "White")


