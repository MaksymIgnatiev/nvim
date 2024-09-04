-- ~/.config/nvim/init.lua

package.path = package.path ..";/home/arrow_function/.config/nvim/lua/?/init.lua;/home/arrow_function/.config/nvim/lua/plugins/?.lua;/home/arrow_function/.config/nvim/lua/plugins/config/?.lua;/home/arrow_function/.config/nvim/lua/global/?.lua"

-- Load all the configuration

-- './lua/global'
require('global')
-- './lua/plugins'
require('plugins')
-- './lua/essential'
require('essential')
