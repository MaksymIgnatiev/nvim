---@class TableConfig
---@field [1] string
---@field run string | function | nil
---@field requires string[] | nil
---@field branch string | nil

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
	'hoob3rt/lualine.nvim',
	{'neoclide/coc.nvim', branch = "master", run = "npm ci"},
	'hrsh7th/nvim-cmp',
	'jose-elias-alvarez/null-ls.nvim',
	'karb94/neoscroll.nvim',     -- Smooth scrolling
	'kosayoda/nvim-lightbulb',
	'lewis6991/gitsigns.nvim',
	'lvimuser/lsp-inlayhints.nvim', -- inline infered types in
	'mhartington/formatter.nvim',
	'neovim/nvim-lspconfig',
	'norcalli/nvim-colorizer.lua', -- Color preview
	'numToStr/Comment.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-treesitter/nvim-treesitter',
	'preservim/nerdtree',    -- NerdTree
	'ryanoasis/vim-devicons',
	'tc50cal/vim-terminal',
	'tpope/vim-commentary',
	'tpope/vim-surround',   -- Suroundings
	'vim-airline/vim-airline', -- Status bar
	'wbthomason/packer.nvim',
	'williamboman/mason-lspconfig.nvim',
	'williamboman/mason.nvim',
	'MysticalDevil/inlay-hints.nvim', -- inlay hints (that works)
	-- 'mrcjkb/rustaceanvim', -- tools for rust
	'typed-rocks/ts-worksheet-neovim', -- inline results from running js/ts files
	'lukas-reineke/indent-blankline.nvim', -- indentation highlights
	'honza/vim-snippets',
	'neoclide/coc-snippets'
}

return plugins
