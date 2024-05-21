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
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      vim.cmd.colorscheme 'kanagawa-wave'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- 'gremble0/yellowbeans.nvim',
  {

    'folke/tokyonight.nvim',
    -- lazy = false,
    -- priority = 1001, -- make sure to load this before all the other start plugins
    -- init = function()
    --   vim.cmd.colorscheme 'tokyonight-night'
    --   vim.cmd.hi 'Comment gui=none'
    -- end,
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
  },
  -- 'Shatur/neovim-ayu',
  'RRethy/base16-nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  -- 'ricardoraposo/gruvbox-minor.nvim',
}
