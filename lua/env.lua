--- @alias OSName '"Linux"' | '"WindowsNT"' | '"Darwin"'

--- @class EnvModule
--- @field os OSName Operating system name (string literal type)
--- @field is_termux boolean Is running in Termux or not
--- @field config string|string[] Path to the nvim configuration
local M = {
	os = vim.uv.os_uname().sysname,
	is_termux = os.getenv("TERMUX_VERSION") ~= nil,
	config = vim.fn.stdpath('config')
}


return M
