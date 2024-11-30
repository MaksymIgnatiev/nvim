-- ~/.config/nvim/lua/global/keymaps.lua

-- Russian keyboard layout on qwerty layout

require("keyboard_qwerty_ru")

local bufopts = { noremap = true, silent = true, expr = false }


-- Normal mode
-- Telescope: find files
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', bufopts)

-- Telescope: find by text
-- vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', bufopts)

-- Telescope: show buffers
vim.keymap.set('n', '<C-b>', ':Telescope buffers<CR>', bufopts)

-- Telescope: show help tags
-- vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', bufopts)

-- NerdTree: toggle
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>', bufopts)

-- Intelisense: show error
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)

-- Go to definition
vim.keymap.set('n', '<leader>gd', ':Telescope lsp_definitions<CR>', bufopts)

-- Align selected area with regex
vim.keymap.set('n', '<leader>t', [[:lua require("functions").TabularizeWithInput()<CR>]], bufopts)


-- Intelisence: show window
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', bufopts)
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', bufopts)
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', bufopts)
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', bufopts)


-- Intelisense: rename identifier
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)

-- Intelisense: code action
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

-- Cancel selection/hithlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<Bar>echo<CR>', bufopts)



vim.keymap.set('n', 'J', 'mzJ`z', bufopts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', bufopts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', bufopts)
vim.keymap.set('n', 'n', 'nzzzv', bufopts)
vim.keymap.set('n', 'N', 'Nzzzv', bufopts)

vim.keymap.set('n', '<leader>y', '"+y', bufopts)

-- Preserve delete
vim.keymap.set('n', '<leader>d', '"_d', bufopts)

-- Format the current buffer
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end, bufopts)

-- Make current file executable (shame on you, windows)
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', bufopts)

-- Substitute the word under cursor
vim.keymap.set('n', '<leader>sg', ':%s/\\<<C-r><C-w\\>/<C-r><C-w>/gI<Left><Left><Left>', bufopts)
vim.keymap.set('n', '<leader>sl', ':s/\\<<C-r><C-w\\>/<C-r><C-w>/gI<Left><Left><Left>', bufopts)


-- Visual mode

-- Yank globaly ("+ register)
vim.keymap.set('v', '<leader>y', '"+y', bufopts)
vim.keymap.set('v', '<leader>Y', '"+Y', bufopts)

-- Delete without saving to buffer
vim.keymap.set('v', '<leader>d', '"_d', bufopts)

-- Remove part and enter insert mode
vim.keymap.set('v', '<leader>r', '"_di', bufopts)

-- Move selected area up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", bufopts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", bufopts)

-- Align selected area with regex
vim.keymap.set('v', '<leader>t', [[:<C-U>lua require("functions").TabularizeWithInput(true)<CR>]], bufopts)


-- Sort selection automatically
vim.keymap.set('v', '<leader>sa', ":!sort<CR>", bufopts)

-- Sort selection manualy (with flags)
vim.keymap.set('v', '<leader>sm', ":!sort ", {
    silent = false,
    noremap = true,
    expr = false,
    callback = function()
        vim.api.nvim_feedkeys(":!sort ", 'n', false)
    end
})

-- Preserve paste
vim.keymap.set('x', '<leader>p', '"_dP', bufopts)

-- Substitute the word under cursor
vim.keymap.set('v', '<leader>sl', ":'<,'>s/\\<<C-r><C-w\\>/<C-r><C-w>/gI<Left><Left><Left>", bufopts)

-- Insert mode

-- Open intelisense window
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
vim.keymap.set('i', '<C-c>', '<Esc', bufopts)

-- Mixed modes
vim.keymap.set({'n', 'x', 'o'}, 's', function() require('flash').jump() end)
-- vim.keymap.set({'n', 'x', 'o'}, 'S', function() require('flash').treesitter() end)
vim.keymap.set('o', 'r', function() require('flash').remote() end)
-- vim.keymap.set({'o', 'x'}, 'R', function() require('flash').treesitter_search() end)
