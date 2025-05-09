local theme = require 'jbalibrea.core.theme'

return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    -- init = function()
    --   theme.set 'tokyonight'
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
    opts = {
      style = 'night',
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = false,
    opts = {
      disable_background = true,
      styles = {
        italic = false,
        transparency = true,
      },
    },
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      theme.set 'catppuccin'
    end,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      -- black mode
      -- color_overrides = {
      --   mocha = {
      --     base = '#000000',
      --     mantle = '#000000',
      --     crust = '#000000',
      --   },
      -- },
    },
  },

  {
    'sainnhe/sonokai',
    priority = 1000,
    lazy = false,
    init = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = 'shusia'
      -- vim.g.sonokai_transparent_background = '0'
      -- theme.set 'sonokai'
    end,
  },

  {
    'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme 'lackluster-hack' -- my favorite
    -- end,
  },

  {
    'polirritmico/monokai-nightasty.nvim',
    lazy = false,
    priority = 1000,
    -- init = function()
    --   theme.set 'monokai-nightasty'
    --   vim.opt.background = 'dark'
    -- end,
  },
}
