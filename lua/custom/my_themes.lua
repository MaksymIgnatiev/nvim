
local M = {}

function M.preview_themes()
  local theme_dirs = {
    vim.fn.stdpath('config') .. '/colors/',
    '/usr/share/nvim/runtime/colors/',
  }

  local themes = {}
  for _, dir in ipairs(theme_dirs) do
    local files = vim.fn.globpath(dir, '*.vim')
    if files ~= '' then
      vim.list_extend(themes, vim.fn.split(files, '\n'))
    end
  end

  if #themes == 0 then
    vim.api.nvim_err_writeln('No themes found!')
    return
  end

  local function apply_theme(theme_path)
    local theme = vim.fn.fnamemodify(theme_path, ':t:r')
    vim.cmd('colorscheme ' .. theme)
  end

  require('telescope.pickers').new({}, {
    prompt_title = 'Select Theme',
    finder = require('telescope.finders').new_table {
      results = themes,
      entry_maker = function(line)
        return {
          value = line,
          display = vim.fn.fnamemodify(line, ':t:r'),
          ordinal = line,
        }
      end,
    },
    sorter = require('telescope.sorters').get_fuzzy_file(),
    previewer = require('telescope.previewers').new_termopen_previewer {
      get_command = function(entry)
        local theme = vim.fn.fnamemodify(entry.value, ':t:r')
        return { 'bat', vim.fn.expand(entry.value) }
      end,
    },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      local function set_theme()
        local selection = action_state.get_selected_entry()
        if selection then
          apply_theme(selection.value)
        end
      end

      require('telescope.actions').select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection then
          apply_theme(selection.value)
        end
      end)

      require('telescope.actions').select_default:enhance({
        on_change = function()
          set_theme()
        end
      })

      return true
    end,
  }):find()
end


vim.api.nvim_create_user_command('PreviewThemes', function()
  M.preview_themes()
end, {})

return M
