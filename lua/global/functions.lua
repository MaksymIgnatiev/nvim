-- ~/.config/nvim/lua/global/functions.lua

local M = {}

function M.TabularizeWithInput(selected)
	local regex = vim.fn.input('Tabularize regex: ')
	if regex ~= '' then
		vim.cmd((selected and "'<,'>" or "") .. 'Tabularize /' .. regex)
	else
		print('No regex provided.')
	end
end


return M
