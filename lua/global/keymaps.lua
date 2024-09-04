-- ~/.config/nvim/lua/global/keymaps.lua

local bufopts = { noremap = true, silent = true }


-- Normal mode

-- Telescope: find files 
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', bufopts)

-- Telescope: find by text
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', bufopts)

-- Telescope: show buffers
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', bufopts)

-- Telescope: show help tags
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', bufopts)

-- NerdTree: toggle 
vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>', bufopts)

-- Intelisense: show error
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
--vim.keymap.set('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>', bufopts)


-- Intelisence: show window
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-- Intelisense: definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

-- Intelisense: rename identifier
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

-- Intelisense: code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)





-- Visual mode

-- Yank globaly ("+ register)
vim.keymap.set('v', 'yg', '"+y', bufopts)

-- Delete without saving to buffer
vim.keymap.set('v', '<leader>d', '"_d', bufopts)

-- Remove part and enter insert mode
vim.keymap.set('v', '<leader>r', '"_di', bufopts)

-- Insert mode

-- Open intelisense window
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

