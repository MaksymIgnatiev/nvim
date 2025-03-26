-- all custom autocomands goes here

local functions = require "global.functions"

-- Hide values in '.env' files
-- vim.cmd([[
--   augroup EnvFileGroup
--     autocmd!
--     autocmd BufRead .env* lua require("global.functions").toggle_env_values()
--   augroup END
-- ]])
