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

local lspconfig = require('lspconfig')
lspconfig.zls.setup {
  -- Server-specific settings. See `:help lspconfig-setup`

  -- omit the following line if `zls` is in your PATH
  --cmd = { '/usr/share/tools/zig/zsl/zsl/zsl' },
  -- There are two ways to set config options:
  --   - edit your `zls.json` that applies to any editor that uses ZLS
  --   - set in-editor config options with the `settings` field below.
  --
  -- Further information on how to configure ZLS:
  -- https://github.com/zigtools/zls/wiki/Configuration
  --settings = {
    --zls = {
      -- omit the following line if `zig` is in your PATH
      --zig_exe_path = '/path/to/zig_executable',
    --}
  --}
}
