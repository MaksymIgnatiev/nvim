--- @class LSP
--- @field default string[] # Default LSPs
--- @field termux_exclude string[] # Array of strings representing LSPs to exclude inside Termux (just for fun, or because of incompatibility)

--- @class Config
--- @field lsp LSP
local M = {}

M.lsp = {
	default = { "ts_ls", "pyright", "lua_ls", "rust_analyzer", "bashls", "omnisharp", "marksman", "zls", "clangd", "asm_lsp"},
	termux_exclude = { "rust_analyzer", "lua_ls" },
}

return M
