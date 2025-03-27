-- ~/.config/nvim/lua/global/keymaps.lua

-- Russian keyboard layout on qwerty layout

require("global.keyboard_qwerty_ru")

local bufopts = { noremap = true, silent = true, expr = false }
local functions = require("global.functions")
local map = vim.keymap.set
local expr = { noremap = true, silent = true, expr = true }

-- Map `F1` to nothing
map({'n', 'x'}, '<F1>', '<NOP>')

-- Normal mode
-- Telescope: find files
map('n', '<C-p>', ':Telescope find_files<CR>', bufopts)


-- Telescope: live grep the contence in all files
map('n', '<C-b>', ':Telescope live_grep<CR>', bufopts)

-- NerdTree: toggle
map('n', '<C-n>', ':NERDTreeToggle<CR>', bufopts)

-- Align pattern with regex
map('n', '<leader>t', functions.TabularizeWithInput, bufopts)

map('n', '<C-k>', '<cmd>cnext<CR>zz', bufopts)
map('n', '<C-j>', '<cmd>cprev<CR>zz', bufopts)
map('n', '<leader>k', '<cmd>lnext<CR>zz', bufopts)
map('n', '<leader>j', '<cmd>lprev<CR>zz', bufopts)
map("n", "<leader>lg", function()
  require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
end, { noremap = true, silent = true })

map("n", '<C-\\>', function()
	require("telescope.builtin").live_grep() 
end, { noremap = true, silent = true })

-- Cancel selection/hithlighting
map('n', '<Esc>', ':nohlsearch<Bar>echo<CR>', bufopts)


map('n', 'J', 'mzJ`z', bufopts)
map('n', '<C-d>', '<C-d>zz', bufopts)
map('n', '<C-u>', '<C-u>zz', bufopts)
map('n', 'n', 'nzzzv', bufopts)
map('n', 'N', 'Nzzzv', bufopts)

map('n', '<leader>y', '"+y', bufopts)
map('n', '<leader>Y', '"+Y', bufopts)

-- Preserve delete
map('n', '<leader>d', '"_d', bufopts)

-- Format the current buffer
map('n', '<leader>f', function() vim.lsp.buf.format() end, bufopts)

-- Make current file executable (shame on you, windows)
map('n', '<leader>x', '<cmd>!chmod +x "%"<CR>', bufopts)

-- Substitute the word under cursor
map('n', '<leader>sg', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
map('n', '<leader>sl', ':s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

map('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- Visual mode

-- Yank globaly ("+ register)
map('v', '<leader>y', '"+y', bufopts)
map('v', '<leader>Y', '"+Y', bufopts)

-- Delete without saving to buffer
map('v', '<leader>d', '"_d', bufopts)

-- Remove part and enter insert mode
map('v', '<leader>r', '"_di', bufopts)

-- Move selected area up/down
map('v', 'J', ":m '>+1<CR>gv=gv", bufopts)
map('v', 'K', ":m '<-2<CR>gv=gv", bufopts)

-- Align selected area with regex
map('v', '<leader>t', function() functions.TabularizeWithInput(true) end, bufopts)


-- Sort selection automatically
map('v', '<leader>sa', ":!sort<CR>", bufopts)

-- Sort selection manualy (with flags)
map('v', '<leader>sm', ":!sort ", {
    silent = false,
    noremap = true,
    expr = false,
    callback = function()
        vim.api.nvim_feedkeys(":!sort ", 'n', false)
    end
})

-- Preserve paste
map('x', '<leader>p', '"_dP', bufopts)

-- Insert mode


map('i', '<C-c>', '<Esc>', expr)

-- Mixed modes
map({'n', 'x', 'o'}, 's', function() require('flash').jump() end)
-- map({'n', 'x', 'o'}, 'S', function() require('flash').treesitter() end)
map('o', 'r', function() require('flash').remote() end)
-- map({'o', 'x'}, 'R', function() require('flash').treesitter_search() end)
