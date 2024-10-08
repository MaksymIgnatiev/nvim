-- ~/.config/nvim/lua/plugins/config/init.lua

local config_bl = {
	"typescript"
}



local function array_includes(array, str)
    for _, value in ipairs(array) do
        if value == str then
            return true
        end
    end
    return false
end
local function require_all_files_in_dir(dir)
	local files = vim.fn.globpath(dir, "*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t")  -- Extract filename
		local module_name = filename:gsub("%.lua$", "")  -- Remove '.lua' extension

		-- Ignore the `init.lua` file
		if module_name ~= "init" and not array_includes(config_bl, module_name) then
			local require_path = dir:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", ".") .. "." .. module_name

			-- Dynamically require the module
			pcall(require, require_path)
		end
	end
end



-- Call the function with the path to your plugins/config directory
require_all_files_in_dir(vim.fn.stdpath('config') .. '/lua/plugins/config')
