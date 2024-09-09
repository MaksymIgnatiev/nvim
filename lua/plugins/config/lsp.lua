-- ~/.config/nvim/lua/plugins/config/lsp.lua


local lspconfig = require('lspconfig')


-- `$ bun i -g typescript-language-server`
lspconfig.ts_ls.setup{}
-- lspconfig.tsserver.setup{}

-- `$ bun i -g lua-language-server`
lspconfig.lua_ls.setup{}

-- `$ curl -L https://github.com/artempyanykh/marksman/releases/latest/download/marksman-linux -o marksman`
-- `$ chmod +x marksman`
-- `$ sudo mv marksman /usr/local/bin/`
lspconfig.marksman.setup{
	cmd = { "/usr/local/bin/marksman" },
	settings = { marksman = { files = { include = { "**/*.md" } } } }
}

-- `$ bun i -g bash-language-server`
lspconfig.bashls.setup{
    filetypes = { "sh", "bash", "zsh" }
}


local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- `$ bun i -g pyright`
lspconfig.pyright.setup {
  capabilities = capabilities
}

-- `$ rustup component add rust-analyzer`
-- or
-- `$ cargo install rust-analyzer`
lspconfig.rust_analyzer.setup{
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
                disabled = { "unused_variables", "unused_mut" }  -- Disable unused variable tips
            },
		}
	},
	flags = {
		debounce_text_changes = 150,
	}
}


