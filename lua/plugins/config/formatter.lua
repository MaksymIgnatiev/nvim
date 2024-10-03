require('formatter').setup({
    filetype = {
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--use-tabs", "--tab-width", "4" },
                    stdin = true
                }
            end
        },
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--use-tabs", "--tab-width", "4" },
                    stdin = true
                }
            end
        },
        -- Add other file types if needed
    }
})

-- Autoformat on save
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts FormatWrite
  augroup END
]])

