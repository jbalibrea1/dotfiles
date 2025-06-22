local theme = require 'jbalibrea.core.theme'
local transparent = false

---@module 'lazy'
---@type LazySpec[]
return {
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    priority = 1000,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    opts = {
      style = 'moon',
      transparent = transparent,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
    -- config = function(_, opts)
    --   require('tokyonight').setup(opts)
    --   theme.set 'tokyonight'
    -- end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = true,
    opts = {
      disable_background = transparent,
      styles = {
        italic = false,
        transparency = transparent,
      },
    },
    -- config = function(_, opts)
    --   require('rose-pine').setup(opts)
    --   theme.set 'rose-pine'
    -- end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = transparent,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      -- black mode
      -- color_overrides = {
      --   mocha = {
      --     base = '#000000',
      --     mantle = '#000000',
      --     crust = '#000000',
      --   },
      -- },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      theme.set 'catppuccin'
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = true,
    priority = 1000,
    config = function()
      require('github-theme').setup {
        -- ...
      }
    end,
  },

  {
    'slugbyte/lackluster.nvim',
    lazy = true,
    priority = 1000,
    config = function() end,
  },

  {
    'webhooked/kanso.nvim',
    lazy = true,
    priority = 1000,
    -- config = function(_, opts)
    --   require('kanso').setup(opts)
    --   theme.set 'kanso'
    -- end,
  },

  {
    'sainnhe/sonokai',
    lazy = true,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.sonokai_enable_italic = true
    end,
  },
}
