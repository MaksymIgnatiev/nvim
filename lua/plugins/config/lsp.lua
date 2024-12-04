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
vim.opt.signcolumn = 'yes'

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

local util = require("lspconfig.util")

local lsp_configs = {
	["ts_ls"] = {
		on_attach = function(client, bufnr)
			require('lsp-inlayhints').on_attach(client, bufnr)
		end,
	},
	["pyright"] = {
	},
	["lua_ls"] = {
		on_attach = function(client, bufnr)
			require('lsp-inlayhints').on_attach(client, bufnr)
		end,
		root_dir = function (fname)
			return util.find_git_ancestor(fname) or util.path.dirname(fname)
		end
	},
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
					disabled = { "unused_variables", "unused_mut" , "unlinked-file"}
				}
			}
		},
		flags = {
			debounce_text_changes = 100
		}
	},
	["marksman"] = {
		-- cmd = { "/usr/local/bin/marksman" },
		settings = { marksman = { files = { include = { "**/*.md" } } } }
	},
	["bashls"] = {
		filetypes = { "sh", "bash", "zsh" }
	},
	["omnisharp"] = {},
	["clangd"] = {},
	["zls"] = {}
}

local lspconfig = require('lspconfig')

for _, lsp in ipairs(lsps) do
	if lsp_configs[lsp] then
		lspconfig[lsp].setup(lsp_configs[lsp])
	end
end
