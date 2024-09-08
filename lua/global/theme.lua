local colors = {
    bg = "#000000",
    fg = "#aaffaa",
    red = "#ee5555",
    green = "#22cc22",
    yellow = "#dddd44",
    blue = "#0077ff",
    lightblue = "#00aaff",
    purple = "#aa44aa",
    magenta = "#dd22cc",
    cyan = "#00ddff",
    white = "#eeffee",
    black = "#000000",
    emerald = "#00aa66",
}

local bindings = {
    Normal = { fg = colors.fg },
    Comment = { fg = colors.green },
    Constant = { fg = colors.cyan },
    String = { fg = colors.yellow },
    Identifier = { fg = colors.lightblue },
    Statement = { fg = colors.magenta },
    Braces = { fg = colors.green },
    Function = { fg = colors.yellow },
    PreProc = { fg = colors.lightblue },
    Type = { fg = colors.emerald },
    Special = { fg = colors.red },
    Underlined = { underline = true },
    Error = { fg = colors.red, bg = colors.bg },
    Todo = { fg = colors.bg, bg = colors.yellow, bold = true },
    Search = { fg = colors.white, bg = colors.green }
}


local function apply_highlights()
    for group, opts in pairs(bindings) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

apply_highlights()
