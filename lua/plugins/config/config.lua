--- @class LSP
--- @field termux_exclude string[] # Array of strings representing LSPs to exclude inside Termux (because of incompatibility with `arm` architecture)

--- @class Config
--- @field lsp LSP
local M = {
	lsp = { termux_exclude = { "rust_analyzer", "lua_ls", "clangd", "asm_lsp" } }
}

return M
