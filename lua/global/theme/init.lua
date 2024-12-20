--- Custom colors for customization
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

---@alias GuiValue '"bold"'|'"italic"'|'"underline"'|'"undercurl"'|'"strikethrough"'|'"reverse"'|'"NONE"'
---@alias GuiAttributes string|table<GuiValue, boolean>
---@param group string # The name of the highlight group.
---@param guifg string|nil # Foreground color (e.g., "#RRGGBB" or "NONE").
---@param guibg string|nil # Background color (e.g., "#RRGGBB" or "NONE").
---@param gui GuiValue|GuiAttributes|nil # Table or string representing additional GUI for the group
local function highlight(group, guifg, guibg, gui)
    local gui_string = "NONE"

    if type(gui) == "table" then
        local active_attributes = {}
        for key, value in pairs(gui) do
            if value then
                table.insert(active_attributes, key)
            end
        end
        gui_string = table.concat(active_attributes, ",")
    elseif type(gui) == "string" then gui_string = gui end

    vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui_string))
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

		-- Ignore the `init.lua` file
		if module_name ~= "init"  then
			local require_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".") .. "." .. module_name

			pcall(require, require_path)
		end
	end
end

-- Require all modules in the current dir auromaticaly
require_all_modules_automaticaly(vim.fn.stdpath('config') .. '/lua/global/theme')


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

return { colors = colors, highlight = highlight, link  = link }
