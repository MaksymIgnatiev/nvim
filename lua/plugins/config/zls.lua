-- ~/.config/nvim/lua/plugins/config/zls.lua

-- don't show parse errors in a separate window
vim.g.zig_fmt_parse_errors = 0
-- disable format-on-save from `ziglang/zig.vim`
vim.g.zig_fmt_autosave = 1
-- enable  format-on-save from nvim-lspconfig + ZLS
--
-- ZLS uses `zig fmt` as the formatter.
-- The Zig FAQ answers some questions about `zig fmt`:
-- https://github.com/ziglang/zig/wiki/FAQ
vim.cmd [[autocmd BufWritePre *.zig lua vim.lsp.buf.format()]]
