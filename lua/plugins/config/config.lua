
--- @class Lsp
--- @field default string[] Default lsps
--- @field termux_exclude string[] Array of strings representing LSPs to exclude in Termux
---
--- @class ConfigModule
--- @field lsp Lsp A table containing LSP configurations
local R = {}

R.lsp = {
	default = { "ts_ls", "pyright", "lua_ls", "rust_analyzer", "bashls", "omnisharp", "marksman"},
	termux_exclude = { "rust_analyzer", "lua_ls" },
}

return R
