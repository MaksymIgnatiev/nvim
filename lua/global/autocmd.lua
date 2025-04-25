-- all custom autocomands goes here

local functions = require "global.functions"
vim.cmd [[
	augroup zshAsSh
	  autocmd!
	  autocmd BufRead,BufNewFile *.zsh* set filetype=sh
	augroup END
]]

-- Hide values in '.env' files
-- vim.cmd([[
--   augroup EnvFileGroup
--     autocmd!
--     autocmd BufRead .env* lua require("global.functions").toggle_env_values()
--   augroup END
-- ]])
