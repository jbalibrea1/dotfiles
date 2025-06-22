---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    -- TODO: Remove unused
    -- { '\\', ':Neotree reveal position=right<CR>', { desc = 'NeoTree reveal' } },
    -- { '\\', ':Neotree filesystem reveal right toggle<CR>', { desc = 'NeoTree toggle' } },
    -- { '\\', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    window = {
      position = 'right',
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      filtered_items = {
        always_show_by_pattern = {
          '.env*',
        },
      },
    },
  },
}
