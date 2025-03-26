-- ~/.config/nvim/lua/global/functions.lua

--- Helper functions
-- @module Functions

---@class Functions
local M = {}
local env_values_hidden = {}

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

-- Why?
function M.regexify_word()
	local word = vim.fn.input("Word (empty=word under cursor): ")
	if word == "" then word = vim.fn.expand("<cword>") end
	local regex = word:gsub(".", function(c)
		return string.format("[%s%s]", c:upper(), c:lower())
	end)
	vim.api.nvim_put({ regex }, "c", true, true)
end

---Function to conceal values in .env files
---@generic T : string
---@param char? T Optional char to replace default one: '*'
function M.toggle_env_values(char)
  -- Some more chars to explore: ●
  char = char or '*'

  local filename = vim.fn.expand('%:t')
  if not filename:match('^%.env') then return end

  local bufnr = vim.api.nvim_get_current_buf()

  if not env_values_hidden[bufnr] then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local hidden_lines = {}

    for i, line in ipairs(lines) do
      local key, value = line:match('^([^=]+)%s*=%s*(.+)$')
      if key and value then
        local hidden_value = string.rep(char, #value)
        hidden_lines[i] = key .. '=' .. hidden_value
      else
        hidden_lines[i] = line
      end
    end

    env_values_hidden[bufnr] = lines
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, hidden_lines)
  else
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, env_values_hidden[bufnr])
    env_values_hidden[bufnr] = nil
  end
end

return M
