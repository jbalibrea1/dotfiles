---@module 'lazy'
---@type LazySpec
return {
  'luckasRanarison/tailwind-tools.nvim',
  event = 'VeryLazy',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'neovim/nvim-lspconfig', -- optional
  },
  opts = {}, -- your configuration
}
