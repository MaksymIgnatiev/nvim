-- ~/.config/nvim/lua/plugins/config/lsp.lua


local env = require "env"
local functions = require "global.functions"
local config = require "plugins.config.config"




vim.opt.signcolumn = 'yes'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
	local opts = { buffer = client.buf }

	require("inlay-hints").on_attach(client, bufnr)

	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
end

local lspconfig = require('lspconfig')


-- How to configure popular servers for inlay hints described here:
-- https://github.com/MysticalDevil/inlay-hints.nvim

--- Table that defines all fields available for configuring an LSP client via `require("lspconfig")[lsp_server_name].setup`.
--- @class LSPSetupConfig
--- @field on_attach? fun(client: table, bufnr: number) Callback when the LSP client attaches to a buffer
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
--- @field on_exit? function Callback when the LSP client exits. Receives `(code, signal, client_id)`.

---@type table<string, LSPSetupConfig>
local servers = {
	["cssls"] = {},
	["asm_lsp"] = {
		-- cmd = { "asm-lsp" },
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
	["pyright"] = {},
	["lua_ls"] = {

		-- on_init = function(client)
		-- 	if client.workspace_folders then
		-- 		local path = client.workspace_folders[1].name
		-- 		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
		-- 			return
		-- 		end
		-- 	end

		-- 	client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
		-- 		runtime = { version = 'LuaJIT' },
		-- 		workspace = {
		-- 			checkThirdParty = false,
		-- 			library = { vim.env.VIMRUNTIME },
		-- 		},
		-- 	})
		-- end,
		settings = { Lua = {} },
		root_dir = function(fname)
			return lspconfig.util.root_pattern(".luarc.json", ".git")(fname)
				or lspconfig.util.find_git_ancestor(fname)
				or vim.loop.os_homedir()
		end
	},
	['rust_analyzer'] = {
		-- capabilities = capabilities,
		-- cmd = { "rustup", "run", "stable", "rust-analyzer" },
		-- settings = {
		-- 	["rust-analyzer"] = {
		-- 		checkOnSave = {
		-- 			command = "clippy"
		-- 		},
		-- 		inlayHints = {
		-- 			bindingModeHints = {
		-- 				enable = false,
		-- 			},
		-- 			chainingHints = {
		-- 				enable = true,
		-- 			},
		-- 			closingBraceHints = {
		-- 				enable = true,
		-- 				minLines = 25,
		-- 			},
		-- 			closureReturnTypeHints = {
		-- 				enable = "never",
		-- 			},
		-- 			lifetimeElisionHints = {
		-- 				enable = "never",
		-- 				useParameterNames = false,
		-- 			},
		-- 			maxLength = 25,
		-- 			parameterHints = {
		-- 				enable = true,
		-- 			},
		-- 			reborrowHints = {
		-- 				enable = "never",
		-- 			},
		-- 			renderColons = true,
		-- 			typeHints = {
		-- 				enable = true,
		-- 				hideClosureInitialization = false,
		-- 				hideNamedConstructor = false,
		-- 			},
		-- 		},
		-- 		diagnostics = {
		-- 			enable = false,
		-- 			enableExperimental = true,
		-- 			disabled = { "unused_variables", "unused_mut", "unlinked-file" }
		-- 		},
		-- 		flags = {
		-- 			debounce_text_changes = 100
		-- 		},


			-- }
		-- }
	},
	["marksman"] = {
		-- cmd = { "/usr/local/bin/marksman" },

		settings = { files = { include = { "**/*.md" } } }
	},
	["bashls"] = {
		settings = { filetypes = { "sh", "bash", "zsh" } }
	},
	["omnisharp"] = {},
	["clangd"] = {},
	["zls"] = {},
	["html"] = {}
}

local lsps = vim.tbl_keys(servers)

-- if running inside termux - exclude specific lsp servers (because of incompatibility for `arm` architecture)
if env.is_termux then
	lsps = functions.filterStrings(lsps, config.lsp.termux_exclude)
end

require('mason').setup()

local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup {
	-- Make sure that configured servers are installed
	ensure_installed = lsps,
}


-- Custom overrides for lsp server fields:
-- if not defined - use default values
-- else - combine defined value with default one to use both

---@type LSPSetupConfig
local server_config

for server_name, server_setup in pairs(servers) do
	if not functions.contains(server_name, lsps) then
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

	lspconfig[server_name].setup(server_config)
	::continue::
end
