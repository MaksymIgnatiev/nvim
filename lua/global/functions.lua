-- ~/.config/nvim/lua/global/functions.lua

--- Helper functions
-- @module Functions

---@class Functions
local M = {}

---Run the Tabularize command with promt for regex
---@param selected boolean
function M.TabularizeWithInput(selected)
	local regex = vim.fn.input('Tabularize regex: ')
	if regex ~= '' then
		vim.cmd((selected and "'<,'>" or "") .. 'Tabularize /' .. regex)
	else
		print('No regex provided.')
	end
end

---Filter first string array with values from another (exclude values that presist in second array)
---@param arr1 string[]
---@param arr2 string[]
---@return string[]
function M.filterStrings(arr1, arr2)
	local lookup = {}
	for _, value in ipairs(arr2) do
		lookup[value] = true
	end

	local filtered = {}
	for _, value in ipairs(arr1) do
		if not lookup[value] then
			table.insert(filtered, value)
		end
	end

	return filtered
end

---Check if given string is in the string array
---@generic T
---@param value T
---@param arr T[]
---@return boolean
function M.contains(value, arr)
	for _, v in ipairs(arr) do
		if v == value then return true end
	end
	return false
end

function M.regexify_word()
	local word = vim.fn.input("Word (empty=word under cursor): ")
	if word == "" then word = vim.fn.expand("<cword>") end
	local regex = word:gsub(".", function(c)
		return string.format("[%s%s]", c:upper(), c:lower())
	end)
	vim.api.nvim_put({ regex }, "c", true, true)
end

return M
