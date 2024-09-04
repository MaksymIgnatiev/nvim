-- ~/.config/nvim/lua/plugins/config/null-ls.lua

require("null-ls").setup({ sources = { require("null-ls").builtins.formatting.prettier } })
