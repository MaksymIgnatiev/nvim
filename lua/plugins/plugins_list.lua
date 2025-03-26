---@class TableConfig
---@field [1] string
---@field run? string | function
---@field requires? string[]
---@field branch? string

---@type (string|TableConfig)[]
local plugins = {
	'andweeb/presence.nvim', -- RPC for discord
	'christoomey/vim-tmux-navigator',
	'folke/flash.nvim',
	'folke/lsp-colors.nvim',
	'folke/trouble.nvim',
	'glepnir/lspsaga.nvim',
	'godlygeek/tabular',
	"HiPhish/rainbow-delimiters.nvim",
	'honza/vim-snippets',
	'hoob3rt/lualine.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-path',
	'jose-elias-alvarez/null-ls.nvim',
	'karb94/neoscroll.nvim', -- Smooth scrolling
	'kosayoda/nvim-lightbulb',
	'L3MON4D3/LuaSnip',
	'lewis6991/gitsigns.nvim',
	'lukas-reineke/indent-blankline.nvim', -- indentation highlights
	'lvimuser/lsp-inlayhints.nvim',     -- inline infered types in
	'mbbill/undotree',
	'mhartington/formatter.nvim',
	'MysticalDevil/inlay-hints.nvim', -- inlay hints (that works)
	'neovim/nvim-lspconfig',
	'norcalli/nvim-colorizer.lua', -- Color preview
	'numToStr/Comment.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-treesitter/nvim-treesitter',
	'preservim/nerdtree', -- NerdTree
	'ryanoasis/vim-devicons',
	{ "stevearc/aerial.nvim", config = function() require("aerial").setup() end },
	'tc50cal/vim-terminal',
	'tpope/vim-commentary',
	'tpope/vim-surround',           -- Suroundings
	'typed-rocks/ts-worksheet-neovim', -- inline results from running js/ts files
	'vim-airline/vim-airline',      -- Status bar
	'wbthomason/packer.nvim',
	'williamboman/mason-lspconfig.nvim',
	'williamboman/mason.nvim',
}

return plugins
