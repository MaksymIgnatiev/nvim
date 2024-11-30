require('formatter').setup({
    filetype = {
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                    stdin = true
                }
            end
        },
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
                    stdin = true
                }
            end
        },
    }
})

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts FormatWrite
  augroup END
]])

