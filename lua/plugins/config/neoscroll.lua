-- ~/.config/nvim/lua/plugins/config/neoscroll.lua

local neoscroll = require('neoscroll')

neoscroll.setup({ easing = "linear" })

--- Duration for every animation
local duration = 120
local middle_duration = duration / 2
local small_duration = duration / 3

local function zz() neoscroll.zt({ half_win_duration = small_duration }) end

local keymap = {
	["zt"]    = zz,
	["zz"]    = function() neoscroll.zz({ half_win_duration = small_duration }) end,
	["zb"]    = function() neoscroll.zb({ half_win_duration = small_duration }) end,
	["<C-u>"] = function() neoscroll.ctrl_u({ duration = duration }) end,
	["<C-d>"] = function() neoscroll.ctrl_d({ duration = duration }) end,
	["<C-b>"] = function() neoscroll.ctrl_b({ duration = duration }) end,
	["<C-f>"] = function() neoscroll.ctrl_f({ duration = duration }) end,
	["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = middle_duration }) end,
	["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = middle_duration }) end,
}

local modes = { 'n', 'v', 'x' }

for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end
