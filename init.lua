vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.shell = '/bin/zsh'
vim.opt.clipboard:append('unnamedplus')
vim.cmd("syntax on")
vim.cmd('colorscheme wildcharm')
vim.g.mapleader = ' '
vim.g.airline_powerline_fonts = 1

vim.cmd [[
  highlight GitGutterAdd guifg=#00FF00 guibg=NONE
  highlight GitGutterChange guifg=#FFFF00 guibg=NONE
  highlight GitGutterDelete guifg=#FF0000 guibg=NONE
]]

-- vim.cmd([[
  -- cnoreabbrev q echoerr "E492: Not an editor command: q"
-- ]])

require('custom.my_themes')
require('custom.smooth_scrolling')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'



  use 'tpope/vim-surround'          -- Surrounding ysw)
  use 'preservim/nerdtree'          -- NerdTree
  use 'tpope/vim-commentary'        -- For Commenting gcc & gc
  use 'vim-airline/vim-airline'     -- Status bar
  use 'ap/vim-css-color'            -- CSS Color Preview
  use 'rafi/awesome-vim-colorschemes'  -- Retro Scheme
  use 'ryanoasis/vim-devicons'      -- Developer Icons
  use 'tc50cal/vim-terminal'        -- Vim Terminal
  use 'preservim/tagbar'            -- Tagbar for code navigation
  use 'terryma/vim-multiple-cursors'-- CTRL + N for multiple cursors
  use 'flazz/vim-colorschemes'      -- Additional colorschemes
  use {
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
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }


  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  use 'joshdick/onedark.vim'
  

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use 'andweeb/presence.nvim' -- RPC for discord
   
  use 'karb94/neoscroll.nvim' -- Smooth scrolling

 
  if packer_bootstrap then
    require('packer').sync()
  end
end)


local saga = require 'lspsaga'
saga.setup {}

require("presence").setup({
    -- General options
    auto_update         = true,                       
    neovim_image_text   = "The One True Text Editor",
    main_image          = "neovim",
    --client_id           = "793271441293967371",
    log_level           = nil, 
    debounce_timeout    = 10,                         
    enable_line_number  = true,                      
    blacklist           = {},                         
    buttons             = true,                       
    file_assets         = {},                        
    show_time           = true,              

    editing_text        = "Editing %s",             
    file_explorer_text  = "Browsing %s",           
    git_commit_text     = "Committing changes",   
    plugin_manager_text = "Managing plugins",    
    reading_text        = "Reading %s",         
    workspace_text      = "Working on %s",     
    line_number_text    = "Line %s : %s",
})

-- Normal mode

-- Telescope: find files 
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Telescope: find by text
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Telescope: show buffers
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Telescope: show help tags
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })

-- Intelisense: show error
vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })


-- Настройка клавиш для вывода окна с информацией
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true, noremap = true })

-- Visual mode

-- Yank globaly ("+ register)
vim.keymap.set('v', 'yg', '"+y', { noremap = true, silent = true })

-- Delete without saving to buffer
vim.keymap.set('v', '<leader>d', '"_d', { noremap = true, silent = true })

-- Remove part and enter insert mode
vim.keymap.set('v', '<leader>r', '"_di', { noremap = true, silent = true })

-- Insert mode

-- Open intelisense window
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup{
  on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  end
}

lspconfig.lua_ls.setup{}



require('lsp-colors').setup()
require('trouble').setup()
require('lspsaga').setup({})
require('nvim-lightbulb').setup({autocmd = {enabled = true}})


require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.prettier,
    -- require("null-ls").builtins.diagnostics.eslint,
  },
})

require('telescope').setup{
  defaults = {
    -- настройки по умолчанию
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    multi_icon = "<>",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- измените это, если нужно
  },
  extensions = {
    -- настройки для расширений
  }
}


local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Используем LuaSnip для сниппетов
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов автодополнения
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтверждение выбора
    ['<Tab>'] = cmp.mapping.select_next_item(), -- Перемещение по меню
    ['<S-Tab>'] = cmp.mapping.select_prev_item(), -- Перемещение назад
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Настройка lspconfig для работы с nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pyright.setup {
  capabilities = capabilities
}


require('gitsigns').setup{}

vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#00FF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#FFFF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#FF0000', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = '#00FF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = '#FFFF00', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = '#FF0000', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { bg = '#003300' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { bg = '#333300' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { bg = '#330000' })

