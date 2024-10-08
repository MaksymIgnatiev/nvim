-- ~/.config/nvim/lua/plugins/config/lsp.lua

local env =	require "env"
local functions = require "functions"
local config = require "config"


local lsps

if env.is_termux then
	lsps = functions.filterStrings(config.lsp.default, config.lsp.termux_exclude)
else
	lsps = config.lsp.default
end

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = lsps })


local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define a mapping of LSP names to their configurations
local lsp_configs = {
	["ts_ls"] = {
		capabilities = capabilities
	},
	["pyright"] = {
		capabilities = capabilities
	},
	["lua_ls"] = {},
	["rust_analyzer"] = {
		on_attach = function(client, bufnr)
			require('lsp-inlayhints').on_attach(client, bufnr)
		end,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				},
				inlayHints = {
					typeHints = true,
					parameterHints = true,
				},
				diagnostics = {
					enable = true,
					enableExperimental = true,
					disabled = { "unused_variables", "unused_mut" }
				}
			}
		},
		flags = {
			debounce_text_changes = 150
		}
	},
	["marksman"] = {
		-- cmd = { "/usr/local/bin/marksman" },
		settings = { marksman = { files = { include = { "**/*.md" } } } }
	},
	["bashls"] = {
		filetypes = { "sh", "bash", "zsh" }
	},
	["omnisharp"] = {}
}

for _, lsp in ipairs(lsps) do
	if lsp_configs[lsp] then
		lspconfig[lsp].setup(lsp_configs[lsp])
	end
end
