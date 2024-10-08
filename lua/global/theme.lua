
local colors = {
    bg = "#0a110a",        -- Background color
    fg = "#99ee99",        -- Foreground color (text)
    green = "#55cc55",     -- Green color for various highlights
    dark_green = "#115511", -- Dark green for subtle elements
    comment = "#226622",   -- Color for comments
    yellow = "#dddd44",
    blue = "#0077ff",      -- For constants
    lightblue = "#00aaff", -- For variables and object properties
    purple = "#aa44aa",    -- For block keywords
    magenta = "#dd22cc",
    cyan = "#00ddff",
    white = "#eeffee",
    black = "#000000",
    emerald = "#00cc66",
    orange = "#d7875f",    -- Light orange/brown for strings
    darkblue = "#0066aa",  -- Dark blue for function/variable keywords

    cursor_line = "#225522", -- Cursor line background
    visual = "#336633",    -- Visual mode selection color
    search = "#114411",     -- Search highlight color
}

-- Set the background color
vim.o.background = "dark" -- Set the background to dark


-- Set highlights
local highlight = function(group, guifg, guibg, gui)
    vim.cmd(string.format("highlight %s guifg=%s guibg=%s gui=%s", group, guifg or "NONE", guibg or "NONE", gui or "NONE"))
end

highlight("Normal", colors.fg, colors.bg)                -- Normal text
highlight("Comment", colors.comment, colors.bg)          -- Comments
highlight("Visual", colors.fg, colors.visual)            -- Visual mode selection
highlight("Search", colors.fg, colors.search)            -- Search highlight

highlight("StatusLineNC", colors.comment, colors.bg)     -- Non-current status line

highlight("Identifier", colors.lightblue)                -- Variable names, object properties
highlight("Function", colors.yellow)                     -- Function/method names
highlight("Keyword", colors.darkblue)                    -- Function/variable keywords (e.g., let, const)
highlight("Statement", colors.purple)                    -- Block keywords (for, if, else, etc.)
highlight("Type", colors.green)                          -- Type names
highlight("Constant", colors.blue)                       -- Constants
highlight("Number", colors.green)                        -- Number literals
highlight("String", colors.orange)                       -- Strings

highlight("@keyword", colors.darkblue)                   -- For keywords like import/export
highlight("@string", colors.orange)                      -- For strings
highlight("@function", colors.yellow)                    -- For function/method names
highlight("@constant", colors.blue)                      -- For constants
highlight("@variable", colors.lightblue)                 -- For variables and object properties
highlight("@method", colors.yellow)                      -- For methods (ensure global methods are colored properly)
highlight("@type", colors.green)


highlight("Include", colors.green)                       -- Include directives
highlight("Macro", colors.green)                         -- Macros
highlight("Define", colors.green)                        -- Preprocessor macros





vim.cmd("highlight Cursor guifg=" .. colors.bg .. " guibg=" .. colors.fg)

