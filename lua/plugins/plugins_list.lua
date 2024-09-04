local plugins = {
  'wbthomason/packer.nvim',               -- Packer can manage itself
  'tpope/vim-surround',                   -- Surrounding ysw)
  'preservim/nerdtree',                   -- NerdTree
  'tpope/vim-commentary',                 -- For Commenting gcc & gc
  'vim-airline/vim-airline',              -- Status bar
  'ap/vim-css-color',                     -- CSS Color Preview
  'ryanoasis/vim-devicons',               -- Developer Icons
  'tc50cal/vim-terminal',                 -- Vim Terminal
  'preservim/tagbar',                     -- Tagbar for code navigation
  'terryma/vim-multiple-cursors',         -- CTRL + N for multiple cursors
  'hrsh7th/nvim-cmp',                     -- Autocomplete
  'hrsh7th/cmp-buffer',                   -- Buffer source for nvim-cmp
  'hrsh7th/cmp-path',                     -- Path source for nvim-cmp
  'hrsh7th/cmp-nvim-lsp',                 -- LSP source for nvim-cmp
  'hrsh7th/cmp-nvim-lua',                 -- Lua source for nvim-cmp
  'saadparwaiz1/cmp_luasnip',             -- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip',                     -- Snippet engine
  'andweeb/presence.nvim',                -- RPC for discord
  'karb94/neoscroll.nvim',                -- Smooth scrolling

  -- Plugin configurations as tables
  {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'folke/trouble.nvim',
    'folke/lsp-colors.nvim',
    'glepnir/lspsaga.nvim',
    'kosayoda/nvim-lightbulb',
    'nvim-lualine/lualine.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  },
}


return plugins
