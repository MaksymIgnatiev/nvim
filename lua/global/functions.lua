-- ~/.config/nvim/lua/global/functions.lua

--- Helper functions
-- @module Functions

---@class Functions
---@field TabularizeWithInput fun(selected?: boolean)
---@field filterStrings fun(arr1: string[], arr2: string[]): string[]
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

---Filter first string array with values from another
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


return M
