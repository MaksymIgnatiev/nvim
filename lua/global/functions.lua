-- ~/.config/nvim/lua/global/functions.lua

---@module "Functions" Custom user-defined functions

--- Custom user-defined functions
---@class Functions
local M = {}

---Run the Tabularize command with promt for regex
---@param selected boolean
function M.TabularizeWithInput(selected)
	local regex = vim.fn.input('Tabularize regex: ')
	if regex ~= '' then
		vim.cmd((selected and "'<,'>" or "") .. 'Tabularize ' .. regex)
	else
		print('No regex provided.')
	end
end

---Filter source array with values from filter array 
---(exclude values from source array that presist in filter array; makes copy)
---@generic T
---@param source T[]
---@param filter T[]
---@return T[]
function M.filter(source, filter)
	local lookup = {}
	for _, value in ipairs(filter) do
		lookup[value] = true
	end

	local filtered = {}
	for _, value in ipairs(source) do
		if not lookup[value] then table.insert(filtered, value) end
	end

	return filtered
end

---Check if given value is in the array
---@generic T
---@param value T
---@param array T[]
---@return boolean
function M.contains(value, array)
	for _, v in ipairs(array) do
		if v == value then return true end
	end
	return false
end

return M
