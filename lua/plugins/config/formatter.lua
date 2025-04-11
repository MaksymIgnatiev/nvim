local fn = function ()
	local args = {
		exe = "prettier",
		args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())) },
		stdin = true
	}
	return args

end

require('formatter').setup({
	filetype = {
		javascript = { fn },
		typescript = { fn },
		svelte = { fn },
	}
})

vim.cmd([[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.svelte,*.json,*.html,*.css FormatWrite
  augroup END
]])

