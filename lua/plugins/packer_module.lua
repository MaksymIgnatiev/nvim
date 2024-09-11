-- ~/.config/nvim/lua/plugins/packer_module.lua

local packer = require('packer')

local plugins = require("plugins_list")

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end


packer.startup(function(use)
	local packer_bootstrap = ensure_packer()

	for _, plugin in ipairs(plugins) do
		use(plugin) -- using every plugin listed in list
	end

	if packer_bootstrap then
		packer.sync()
	end
end)
