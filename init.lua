-- ~/.config/nvim/init.lua

local home = os.getenv("HOME")

package.path = package.path .. ";" .. home .. "/.config/nvim/lua/?/init.lua;" .. home .. "/.config/nvim/lua/plugins/?.lua;" .. home .. "/.config/nvim/lua/plugins/config/?.lua;" .. home .. "/.config/nvim/lua/global/?.lua"

-- Load all the configuration

-- './lua/global'
require('global')
-- './lua/plugins'
require('plugins')
-- './lua/essential'
require('essential')
