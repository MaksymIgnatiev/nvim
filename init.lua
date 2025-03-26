-- ./init.lua

local env = require("env")

local config = env.config

---@param path string
local function append_path(path)
	package.path = package.path .. ";" .. path
end

if env.os == "Linux" then
	-- Linux specific configuration
	append_path(config .. "/lua/?.lua")
	append_path(config .. "/lua/?/init.lua")
elseif env.os == "Windows_NT" then
	-- Windows specific configuration (why?)
	append_path(config .. "\\lua\\?.lua")
	append_path(config .. "\\lua\\?\\init.lua")
end

-- Load all the configuration
require('global')
require('plugins')
require('essential')
