--- Custom colors for customization
local colors = {
	bg = "#001100",
	fg = "#99ee99",
	green = "#55cc55",
	darkgreen = "#115511",
	almostblackgreen = "#002200",
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

return { colors = colors, highlight = highlight, link  = link }
