-- ~/.config/nvim/lua/plugins/config/telescope.lua

local telescope_sorters = require('telescope.sorters')

require('telescope').setup{
	defaults = {
		border = {},
		color_devicons = true,
		entry_prefix = "  ",
		file_sorter = telescope_sorters.get_fuzzy_file,
		generic_sorter = telescope_sorters.get_generic_fuzzy_sorter,
		layout_config = { horizontal = { mirror = false }, vertical = { mirror = false }, },
		layout_strategy = "horizontal",
		multi_icon = "<>",
		prompt_prefix = "➜ ",
		selection_caret = "➜ ",
		set_env = { ['COLORTERM'] = 'truecolor' },
		sorting_strategy = "descending",
		use_less = true,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--no-ignore-parent",
			"--glob=!node_modules/*",
			"--glob=!.git/*",
		},
		winblend = 0,
	}
}
