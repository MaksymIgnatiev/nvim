local plugins = {
	'wbthomason/packer.nvim',               -- Packer can manage itself
	'tpope/vim-surround',
	'preservim/nerdtree',                   -- NerdTree
	'tpope/vim-commentary',                 -- For Commenting gcc & gc
	'vim-airline/vim-airline',              -- Status bar
	'norcalli/nvim-colorizer.lua',              -- Color preview
	'ryanoasis/vim-devicons',               -- Developer Icons
	'tc50cal/vim-terminal',                 -- Vim Terminal
	'hrsh7th/nvim-cmp',                     -- Autocomplete
	'hrsh7th/cmp-buffer',                   -- Buffer source for nvim-cmp
	'hrsh7th/cmp-path',                     -- Path source for nvim-cmp
	'hrsh7th/cmp-nvim-lsp',                 -- LSP source for nvim-cmp
	'hrsh7th/cmp-nvim-lua',                 -- Lua source for nvim-cmp
	'saadparwaiz1/cmp_luasnip',             -- Snippets source for nvim-cmp
	'L3MON4D3/LuaSnip',                     -- Snippet engine
	'andweeb/presence.nvim',                -- RPC for discord
	'karb94/neoscroll.nvim',                -- Smooth scrolling
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-treesitter/nvim-treesitter',
	'folke/trouble.nvim',
	'folke/lsp-colors.nvim',
	'glepnir/lspsaga.nvim',
	'kosayoda/nvim-lightbulb',
	{
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	},
	'lvimuser/lsp-inlayhints.nvim',         -- inline infered types in rust
	'neovim/nvim-lspconfig',
	'hoob3rt/lualine.nvim',
	'christoomey/vim-tmux-navigator',
	'jose-elias-alvarez/typescript.nvim',
	'mhartington/formatter.nvim',
	'folke/flash.nvim',
	'godlygeek/tabular',
	'numToStr/Comment.nvim',
}

return plugins
