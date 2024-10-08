return {
  -- 'EdenEast/nightfox.nvim', -- carbonfox
  {
    'rebelot/kanagawa.nvim',
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    -- priority = 1001, -- make sure to load this before all the other start plugins
    -- lazy = false,
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight'
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
    opts = {
      style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      transparent = false, -- Enable this to disable setting the background color
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    },
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      disable_background = true,
      styles = {
        italic = false,
        transparency = false,
      },
    },
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1001, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    -- opts = {
    --   flavour = 'mocha',
    --   transparent_background = false,
    -- },
  },

  --
  -- new themes
  --
  {
    'sainnhe/sonokai',
    -- init = function()
    --   vim.g.sonokai_enable_italic = true
    --   -- vim.g.sonokai_style = 'shusia'
    --   -- vim.g.sonokai_transparent_background = '0'
    --   vim.cmd.colorscheme 'sonokai'
    -- end,
  },
  -- { 'ofirgall/ofirkai.nvim' },
  -- nightfall and deeper night

  -- new fresh
  -- {
  --   '2giosangmitom/nightfall.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },

  -- grayscale - like the idea
  {
    'slugbyte/lackluster.nvim',
    -- init = function()
    -- vim.cmd.colorscheme 'lackluster'
    -- vim.cmd.colorscheme 'lackluster-hack' -- my favorite
    -- vim.cmd.colorscheme 'lackluster-night'
    -- end,
  },
  {
    'polirritmico/monokai-nightasty.nvim',
  },
}
