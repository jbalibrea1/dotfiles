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
    -- { '\\', ':Neotree reveal position=right<CR>', { desc = 'NeoTree reveal' } },
    { '\\', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
    -- { '\\', ':Neotree filesystem reveal right toggle<CR>', { desc = 'NeoTree toggle' } },
  },
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
