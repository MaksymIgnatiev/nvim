-- ~/.config/nvim/lua/plugins/config/init.lua

local function require_all_files_in_dir(dir)
	local files = vim.fn.globpath(dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t")  -- Extract filename
		local module_name = filename:gsub("%.lua$", "")  -- Remove '.lua' extension

		-- Ignore the `init.lua` file
		if module_name ~= "init" then
			local require_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".") .. "." .. module_name

			-- Dynamically require the module
			pcall(require, require_path)
		end
	end
end

-- Call the function with the path to your plugins/config directory
require_all_files_in_dir(vim.fn.stdpath('config') .. '/lua/plugins/config')
