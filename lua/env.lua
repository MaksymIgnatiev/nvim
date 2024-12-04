-- ./lua/env.lua

--- @alias OSName '"Linux"' | '"WindowsNT"'
--- @class EnvModule
--- @field os OSName Operating system name (string literal type)
--- @field is_termux boolean Is running in Termux or not
--- @field config string Path to the nvim configuration
local M = {}

M.os = vim.loop.os_uname().sysname
M.is_termux = os.getenv("TERMUX_VERSION") ~= nil
M.config = vim.fn.stdpath('config')

return M
