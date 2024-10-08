require'nvim-treesitter.configs'.setup {
  -- List of parsers to install
  ensure_installed = { "typescript", "javascript", "html", "css", "lua", "python", "rust", "python", "c", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- Enable syntax highlighting (Tree-sitter's primary feature)
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,  -- Disable default regex-based highlighting
  },

  -- Enable incremental selection (optional)
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  -- Enable code folding based on Tree-sitter parsing (optional)
  indent = {
    enable = true
  },
}
