local functions = require( "global.functions")

---List of config files to exclude from requiring 
---(they are listed inside the current directory)
---e.g. "lsp", "flash"
---@type string[]
local config_blacklist = { "noice" }


---Require all files in the given directory, except for `init.lua` and those that are listed int the blacklist
---@param dir string
local function require_all_files_in_dir(dir)
	local files = vim.fn.globpath(dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t")  -- Extract filename
		local module_name = filename:gsub("%.lua$", "")  -- Remove '.lua' extension

		-- ignore the `init.lua` file and listed in blacklist
		if
			module_name ~= "init"
			and not functions.contains(module_name, config_blacklist)
		then
			local require_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".") .. "." .. module_name
			pcall(require, require_path)
		end
	end
end



require_all_files_in_dir(vim.fn.stdpath('config') .. '/lua/plugins/config')
