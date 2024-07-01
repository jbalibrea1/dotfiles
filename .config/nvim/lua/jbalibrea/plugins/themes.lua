return {
  -- create a theme?
  -- 'rktjmp/lush.nvim',
  'craftzdog/solarized-osaka.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- 'eldritch-theme/eldritch.nvim',
  -- { 'jesseleite/nvim-noirbuddy', opts = { preset = 'miami-nights' }, dependencies = {
  --   { 'tjdevries/colorbuddy.nvim' },
  -- } },
  'EdenEast/nightfox.nvim', -- carbonfox
  {
    'rebelot/kanagawa.nvim',
    -- lazy = false,
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- init = function()
    --   vim.cmd.colorscheme 'kanagawa-wave'
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
  },
  -- 'gremble0/yellowbeans.nvim',
  {

    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1001, -- make sure to load this before all the other start plugins
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight'
    --   vim.cmd.hi 'Comment gui=none'
    -- end,

    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
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
  },
  -- 'Shatur/neovim-ayu',
  -- 'RRethy/base16-nvim',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd 'colorscheme catppuccin'
    end,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = false,
      no_italic = false,
      no_bold = false,
      styles = {
        comments = { 'italic' },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      -- color_overrides = {
      --   mocha = {
      --     base = '#000000',
      --     mantle = '#000000',
      --     crust = '#000000',
      --   },
      -- },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            TabLineSel = { bg = C.pink },
            CmpBorder = { fg = C.surface2 },
            Pmenu = { bg = C.none },
            TelescopeBorder = { link = 'FloatBorder' },
          }
        end,
      },
    },
  },
  'morhetz/gruvbox',
  -- 'ricardoraposo/gruvbox-minor.nvim',
}
