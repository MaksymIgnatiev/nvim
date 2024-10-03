local colors = {
    bg = "#0a110a",        -- Background color
    fg = "#99ee99",        -- Foreground color (text)
    green = "#55cc55",     -- Green color for various highlights
    dark_green = "#115511", -- Dark green for subtle elements
    comment = "#226622",   -- Color for comments
    yellow = "#dddd44",
    blue = "#0077ff",
    lightblue = "#00aaff",
    purple = "#aa44aa",
    magenta = "#dd22cc",
    cyan = "#00ddff",
    white = "#eeffee",
    black = "#000000",
    emerald = "#00cc66",

    cursor_line = "#225522", -- Cursor line background
    visual = "#336633",    -- Visual mode selection color
    search = "#114411",     -- Search highlight color
}
-- 
-- local bindings = {
--     Normal = { fg = colors.fg },
--     Comment = { fg = colors.green },
--     Constant = { fg = colors.cyan },
--     String = { fg = colors.yellow },
--     Identifier = { fg = colors.lightblue },
--     Statement = { fg = colors.magenta },
--     Function = { fg = colors.yellow },
--     PreProc = { fg = colors.lightblue },
--     Type = { fg = colors.emerald },
--     Special = { fg = colors.red },
--     Underlined = { underline = true },
--     Error = { fg = colors.red, bg = colors.bg },
--     Todo = { fg = colors.bg, bg = colors.yellow, bold = true },
--     Search = { fg = colors.white, bg = colors.green }
-- }
-- 
-- 
-- local function apply_highlights()
--     for group, opts in pairs(bindings) do
--         vim.api.nvim_set_hl(0, group, opts)
--     end
-- end
-- 
-- apply_highlights()

-- Set the background color
vim.o.background = "dark" -- Set the background to dark


-- Set highlights
local highlight = function(group, guifg, guibg, gui)
    vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui or "NONE"))
end

-- Basic highlights
highlight("Normal", colors.fg, colors.bg)                -- Normal text
highlight("Comment", colors.comment, colors.bg) -- Comments
-- highlight("CursorLine", colors.bg, colors.cursor_line)   -- Current line
highlight("Visual", colors.fg, colors.visual)            -- Visual mode selection
highlight("Search", colors.fg, colors.search)            -- Search highlight

-- Status line
-- highlight("StatusLine", colors.fg, colors.status_line)   -- Status line color
highlight("StatusLineNC", colors.comment, colors.bg)     -- Non-current status line

-- Syntax highlights
highlight("Identifier", colors.green)                     -- Variable names
highlight("Function", colors.green)                       -- Function names
highlight("Statement", colors.green)                       -- Statements (if, for, etc.)
highlight("Type", colors.green)                           -- Type names

-- Highlight for built-in objects and their methods (globally)
highlight("PreProc", colors.green)                        -- Preprocessor directives
highlight("Special", colors.green)                        -- Special identifiers (like console, etc.)
highlight("Constant", colors.green)                       -- Constants

-- Always highlight global objects and namespaces
highlight("Include", colors.green)                        -- Include directives
highlight("Macro", colors.green)                          -- Macros
highlight("Define", colors.green)                         -- Preprocessor macros





vim.cmd("highlight Cursor guifg=" .. colors.bg .. " guibg=" .. colors.fg)

