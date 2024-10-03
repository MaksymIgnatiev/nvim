-- ~/.config/nvim/init.lua
-- #f00

local config = vim.fn.stdpath('config')

-- print("Config: " .. config)

local os_name = vim.loop.os_uname().sysname

if os_name == "Linux" then

	-- Linux specific configuration
	package.path = package.path .. ";" .. config .. "/lua/?/init.lua;" .. config .. "/lua/plugins/?.lua;" .. config .. "/lua/plugins/config/?.lua;" .. config .. "/lua/global/?.lua"

elseif os_name == "Windows_NT" then

	-- Windows specific configuration
	package.path = package.path .. ";" .. config .. "\\lua\\?\\init.lua;" .. config .. "\\lua\\plugins\\?.lua;" .. config .. "\\lua\\plugins\\config\\?.lua;" .. config .. "\\lua\\global\\?.lua"

end

-- Load all the configuration

-- './lua/global'
require('global')
-- './lua/plugins'
require('plugins')
-- './lua/essential'
require('essential')

-- vim.cmd(':e')
