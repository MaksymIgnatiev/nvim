-- ~/.config/nvim/lua/plugins/config/telescope.lua

local telescope_sorters = require('telescope.sorters')

require('telescope').setup{
  defaults = {
    prompt_prefix = "➜ ",
    selection_caret = "➜ ",
    entry_prefix = "  ",
    multi_icon = "<>",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    file_sorter = telescope_sorters.get_fuzzy_file,
    generic_sorter = telescope_sorters.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
  }
}
