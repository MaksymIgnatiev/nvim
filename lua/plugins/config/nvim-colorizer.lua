-- #f00
require('colorizer').setup(
{
	-- Specific files
	-- use "!name" to exclude a file
	'*', -- Highlight all files, but you can specify specific file types like 'css', 'javascript', etc.
},
{
	-- Global
	names = false, -- "Names" such as `Green`, `Blue`, `Gray`, `Magenta`, etc
	rgb_fn = true,
	RRGGBBAA = true,        -- #RRGGBBAA hex codes
	hsl_fn   = true,        -- CSS hsl() and hsla() functions
}
)

-- DEFAULT_OPTIONS = {
	-- RGB      = true;         -- #RGB hex codes
	-- RRGGBB   = true;         -- #RRGGBB hex codes
	-- names    = true;         -- "Name" codes like Blue
	-- RRGGBBAA = false;        -- #RRGGBBAA hex codes
	-- rgb_fn   = false;        -- CSS rgb() and rgba() functions
	-- hsl_fn   = false;        -- CSS hsl() and hsla() functions
	-- css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	-- css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- -- Available modes: foreground, background
	-- mode     = 'background'; -- Set the display mode.
-- }
-- Auto enabling on each buffer
vim.cmd [[
    autocmd BufRead,BufNewFile * lua require'colorizer'.attach_to_buffer()
]]
