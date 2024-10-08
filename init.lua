-- ./init.lua
-- #f00

local env = require("env")

local config = env.config

if env.os == "Linux" then

	-- Linux specific configuration
	package.path = package.path .. ";" .. config .. "/lua/?/init.lua;" .. config .. "/lua/plugins/?.lua;" .. config .. "/lua/plugins/config/?.lua;" .. config .. "/lua/global/?.lua"

elseif env.os == "Windows_NT" then

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
