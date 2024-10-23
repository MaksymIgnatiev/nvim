
local colors = {
    bg = "#0a110a",
    fg = "#99ee99",
    green = "#55cc55",
    dark_green = "#115511",
    comment = "#226622",
    yellow = "#dddd44",
    blue = "#0077ff",
    lightblue = "#00aaff",
    purple = "#aa44aa",
    magenta = "#dd22cc",
    cyan = "#00ddff",
    white = "#eeffee",
    black = "#000000",
    emerald = "#00cc66",
    orange = "#d7875f",
    darkblue = "#0077cc",
	red = "#aa0000",
    cursor_line = "#225522",
    visual = "#336633",
    search = "#114411",
}


vim.o.background = "dark"



local highlight = function(group, guifg, guibg, gui)
    vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui or "NONE"))
end

highlight("Normal", colors.fg, colors.bg)
highlight("Comment", colors.comment, colors.bg)
highlight("Visual", colors.fg, colors.visual)
highlight("Search", colors.fg, colors.search)

highlight("StatusLineNC", colors.comment, colors.bg)

highlight("TSKeywordImport", colors.magenta)
highlight("Identifier", colors.lightblue)
highlight("Function", colors.yellow)
highlight("Keyword", colors.darkblue)
highlight("Statement", colors.purple)
highlight("Type", colors.green)
highlight("Constant", colors.blue)
highlight("Number", colors.green)
highlight("String", colors.orange)

highlight("@keyword", colors.darkblue)
highlight("@string", colors.orange)
highlight("@function", colors.yellow)
highlight("@constant", colors.blue)
highlight("@variable", colors.lightblue)
highlight("@method", colors.yellow)
highlight("@type", colors.emerald)
highlight("@function.builtin", colors.yellow)
highlight("@lsp.type.regexp", colors.red)
highlight("@string.regexp", colors.red)
highlight("@constructor", colors.blue)
highlight("@attribute.builtin", colors.red)
highlight("@module.builtin", colors.blue)

highlight("Include", colors.green)
highlight("Macro", colors.green)
highlight("Define", colors.green)





vim.cmd("highlight Cursor guifg=" .. colors.bg .. " guibg=" .. colors.fg)

