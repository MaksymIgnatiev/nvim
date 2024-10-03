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

-- Go to definition
vim.keymap.set('n', '<leader>gd', ':Telescope lsp_definitions<CR>', bufopts)

-- Align selected area with regex
vim.keymap.set('n', '<leader>t', [[:lua require("functions").TabularizeWithInput()<CR>]], bufopts)


-- Intelisence: show window
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-- Intelisense: definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

-- Intelisense: rename identifier
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

-- Intelisense: code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<Bar>echo<CR>', bufopts)




-- Visual mode

-- Yank globaly ("+ register)
vim.keymap.set('v', 'yg', '"+y', bufopts)

-- Delete without saving to buffer
vim.keymap.set('v', '<leader>d', '"_d', bufopts)

-- Remove part and enter insert mode
vim.keymap.set('v', '<leader>r', '"_di', bufopts)

-- Align selected area with regex
vim.keymap.set('v', '<leader>t', [[:<C-U>lua require("functions").TabularizeWithInput(true)<CR>]], bufopts)

-- Insert mode

-- Open intelisense window
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })

-- Mixed modes
vim.keymap.set({'n', 'x', 'o'}, 's', function() require('flash').jump() end)
vim.keymap.set({'n', 'x', 'o'}, 'S', function() require('flash').treesitter() end)
vim.keymap.set('o', 'r', function() require('flash').remote() end)
vim.keymap.set({'o', 'x'}, 'R', function() require('flash').treesitter_search() end)

