function ColorMyPencils(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = false, -- Enable this to disable setting the background color
      -- terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        -- sidebars = 'dark', -- style for sidebars, see below
        -- floats = 'dark', -- style for floating windows
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts) -- calling setup is optional
      -- vim.cmd [[colorscheme tokyonight-night]]
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
    -- config = function()
    --   -- Load the colorscheme here
    --   vim.cmd.colorscheme 'tokyonight-night'
    --
    --   -- You can configure highlights by doing something like
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = false,
      }

      -- vim.cmd 'colorscheme rose-pine'

      ColorMyPencils()
    end,
  },
}
