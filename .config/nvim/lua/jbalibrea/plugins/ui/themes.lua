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
    opts = {
      flavour = 'mocha',
      transparent_background = false,
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
