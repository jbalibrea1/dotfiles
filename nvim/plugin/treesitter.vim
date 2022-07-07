lua << EOF

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust","javascript", "typescript","css","html", "scss", "json", "tsx"},
  sync_install = false,
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}

EOF
