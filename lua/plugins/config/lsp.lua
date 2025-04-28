-- ~/.config/nvim/lua/plugins/config/lsp.lua

local env = require "env"
local functions = require "global.functions"
local config = require "plugins.config.config"
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local map = vim.keymap.set
local lspconfig = require('lspconfig')
local inlay_hints = require("inlay-hints")

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end
	end
})


---@class Client
---@field buf number

---Default `on_attach` function
---@param client Client
---@param bufnr number
local on_attach = function(client, bufnr)
	local opts = { buffer = client.buf }

	inlay_hints.on_attach(client, bufnr)

	map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	map({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
end

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- How to configure popular servers for inlay hints described here:
-- https://github.com/MysticalDevil/inlay-hints.nvim

--- Table that defines all fields available for configuring an LSP client via `require("lspconfig")[lsp_server_name].setup` (in theory).
--- @class LSPSetupConfig
--- @field on_attach? fun(client: Client, bufnr: number) Callback when the LSP client attaches to a buffer
--- @field capabilities? table Specifies client capabilities. Can be extended with tools like `cmp_nvim_lsp`.
--- @field cmd? string[] Command to start the LSP server. Example: `{ "pyright-langserver", "--stdio" }`.
--- @field filetypes? string[] List of file types supported by the LSP server. Example: `{ "python", "lua" }`.
--- @field root_dir? function Function to determine the root directory of a project. Receives the file name as an argument.
--- @field settings? table LSP server-specific settings. Example: `{ pylsp = { plugins = { pylint = { enabled = true } } } }`.
--- @field init_options? table Initial options sent during the LSP initialization phase.
--- @field handlers? table Custom handlers for LSP events. Example: `{ ["textDocument/hover"] = custom_handler }`.
--- @field single_file_support? boolean Indicates whether the server supports single files outside a project.
--- @field autostart? boolean Whether to start the server automatically. Defaults to true.
--- @field flags? table Additional flags to configure behavior, such as `debounce_text_changes`.
--- @field name? string The name of the LSP server (typically inferred from the setup call).
--- @field on_init? function Callback when the LSP client initializes.
--- @field on_exit? fun(code: number, signal: number, client_id: number) Callback when the LSP client exits. Receives `(code, signal, client_id)`.

--- List of lsps that you want to be setup.
---
--- Add `["lsp_name"] = {}` to just indicate that you want to use this lsp. Mason will automatically install it
---
--- Add one of the listed above properties to the server config to modify it
---
--- If you want to exclude some lsps from being setup - add names of the lsps in the "plugins.config.config" module under `lsp_disable` field in `lsp` submodule
---
---@type table<string, LSPSetupConfig>
local servers = {
	["cssls"] = {},
	["asm_lsp"] = {
		filetypes = { "asm", "s" },
		root_dir = lspconfig.util.root_pattern(".git", "."),
	},
	["ts_ls"] = {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					-- includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					-- includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		}
	},
	["pylsp"] = {
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						ignore = { 'W391' },
						maxLineLength = 100
					}
				}
			}
		}
	},
	["lua_ls"] = {
		settings = { Lua = { hint = { enable = true } } },
		root_dir = function(fname)
			return lspconfig.util.root_pattern(".luarc.json", ".git")(fname)
				or lspconfig.util.find_git_ancestor(fname)
				or vim.loop.os_homedir()
		end
	},
	['rust_analyzer'] = {
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy"
				},
				inlayHints = {
					bindingModeHints = {
						enable = false,
					},
					chainingHints = {
						enable = true,
					},
					closingBraceHints = {
						enable = true,
						minLines = 25,
					},
					closureReturnTypeHints = {
						enable = "always",
					},
					lifetimeElisionHints = {
						enable = "always",
						useParameterNames = false,
					},
					maxLength = 25,
					parameterHints = {
						enable = true,
					},
					reborrowHints = {
						enable = "always",
					},
					renderColons = true,
					typeHints = {
						enable = true,
						hideClosureInitialization = false,
						hideNamedConstructor = false,
					},
				},
				diagnostics = {
					enable = false,
					enableExperimental = true,
					disabled = { "unused_variables", "unused_mut", "unlinked-file" }
				},
				flags = {
					debounce_text_changes = 100
				},


			}
		}
	},
	["remark_ls"] = {
		cmd = { "remark-language-server", "--stdio" },
		filetypes = { "markdown" },
		root_dir = lspconfig.util.root_pattern(".git", "."),
		settings = {
			remark = { requireConfig = true },
			files = { include = { "**/*.md" } },
		}
	},
	["bashls"] = {
		settings = { filetypes = { "sh", "bash", "zsh" } }
	},
	["omnisharp"] = {},
	["clangd"] = {},
	["zls"] = {},
	["html"] = {},
	["vimls"] = {},
	["ruff"] = {},
	["pyright"] = {},
	["svelte"] = {},
	["mojo"] = {},
	["taplo"] = {},
	["lemminx"] = {},
	["hls"] = {},
	["jsonls"] = {},
}

local lsps = vim.tbl_keys(servers)

-- if running inside termux - exclude specific lsp servers (because of incompatibility for `arm` architecture)
if env.is_termux then
	lsps = functions.filter(lsps, config.lsp.termux_exclude)
end


require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
	-- Make sure that configured (and filtered) servers are installed
	ensure_installed = functions.filter(lsps, config.lsp.mason_exclude),
})


-- Custom overrides for lsp server fields:
-- if not defined - use default values
-- else - combine defined value with default one to use both

---@type LSPSetupConfig
local server_config

for server_name, server_setup in pairs(servers) do
	if
	-- skip servers that are not defined in the lsp list
		not functions.contains(server_name, lsps)
		-- skip servers that are defined in the disable lsp list
		or functions.contains(server_name, config.lsp.disable)
	then
		goto continue
	end

	server_config = server_setup

	if server_config.on_attach then
		local server_onattach = server_config.on_attach
		local new_server_onattach = function(client, bufnr)
			if server_onattach then server_onattach(client, bufnr) end
			on_attach(client, bufnr)
		end
		server_config.on_attach = new_server_onattach
	else
		server_config.on_attach = on_attach
	end

	if not server_config.capabilities then
		server_config.capabilities = capabilities
	end

	if not server_config.handlers then
		server_config.handlers = handlers
	end

	lspconfig[server_name].setup(server_config)

	::continue::
end
