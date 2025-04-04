--- @class LSP
--- @field termux_exclude string[] # Array of strings representing LSPs to exclude inside Termux (because of incompatibility with `arm` architecture)
--- @field disable string[] # Array of strings representing LSPs to exclude from setting up
--- @field mason_exclude string[] # Array of strings representing LSPs to exclude from being interacted by mason

--- @class Config
--- @field lsp LSP
local M = {
	lsp = {
		termux_exclude = { "rust_analyzer", "lua_ls", "clangd", "asm_lsp" },
		disable = { "ruff" },
		mason_exclude = { "mojo" }
	}
}

return M
