return {
  'MeanderingProgrammer/render-markdown.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  init = function()
    -- Define color variables
    -- local color1_bg = '#987afb'
    -- local color2_bg = '#37f499'
    -- local color3_bg = '#04d1f9'
    -- local color4_bg = '#fca6ff'
    -- local color5_bg = '#9ad900'
    -- local color6_bg = '#05ff23'
    --
    -- local color_fg1 = '#2d244b'
    -- local color_fg2 = '#10492d'
    -- local color_fg3 = '#013e4a'
    -- local color_fg4 = '#4b314c'
    -- local color_fg5 = '#1e2b00'
    -- local color_fg6 = '#2d1c08'
    --
    -- local color_fg = '#1e1e2e'
    -- local colorInline_bg = '#a6adc8'
    -- Background highlights (más suaves y balanceadas)
    -- local color1_bg = '#7aa2f7' -- Azul neón suave
    local color1_bg = '#987afb'
    local color2_bg = '#94e2d5' -- Verde menta
    local color3_bg = '#89b4fa' -- Azul pastel
    local color4_bg = '#f5c2e7' -- Rosa suave
    local color5_bg = '#a6e3a1' -- Verde claro
    local color6_bg = '#f9e2af' -- Amarillo crema

    -- Foreground contrasts (oscuros complementarios)
    local color_fg1 = '#1e1e2e' -- Tono oscuro base
    local color_fg2 = '#1a2b25' -- Verde profundo
    local color_fg3 = '#112638' -- Azul petróleo
    local color_fg4 = '#2a1e2f' -- Violeta oscuro
    local color_fg5 = '#1c2713' -- Verde musgo oscuro
    local color_fg6 = '#2e201a' -- Marrón tostado

    -- Global foreground (base de texto)
    local color_fg = '#cdd6f4' -- Gris claro (base para contraste)

    -- Inline code background (caja de inline code o resaltado)
    local colorInline_bg = '#313244' -- Gris azulado

    -- Set highlight groups via Vim command
    vim.cmd(string.format([[highlight Headline1Bg guibg=%s guifg=%s]], color1_bg, color_fg1))
    vim.cmd(string.format([[highlight Headline2Bg guibg=%s guifg=%s]], color2_bg, color_fg2))
    vim.cmd(string.format([[highlight Headline3Bg guibg=%s guifg=%s]], color3_bg, color_fg3))
    vim.cmd(string.format([[highlight Headline4Bg guibg=%s guifg=%s]], color4_bg, color_fg4))
    vim.cmd(string.format([[highlight Headline5Bg guibg=%s guifg=%s]], color5_bg, color_fg5))
    vim.cmd(string.format([[highlight Headline6Bg guibg=%s guifg=%s]], color6_bg, color_fg6))

    -- Define inline code highlight for markdown
    vim.cmd(string.format([[highlight RenderMarkdownCodeInline guifg=%s guibg=%s]], color_fg, colorInline_bg))

    -- Headline "signs" (left symbols)
    vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], color1_bg))
    vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], color2_bg))
    vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], color3_bg))
    vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], color4_bg))
    vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], color5_bg))
    vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], color6_bg))
  end,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    code = {
      sign = false,
      width = 'full',
      right_pad = 1,
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      -- Determines how icons fill the available space:
      --  inline:  underlying text is concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional text
      position = 'inline',
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = '   󰄱 ',
        -- Highlight for the unchecked icon
        highlight = 'RenderMarkdownUnchecked',
        -- Highlight for item associated with unchecked checkbox
        scope_highlight = nil,
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        icon = '   󰱒 ',
        -- Highlight for the checked icon
        highlight = 'RenderMarkdownChecked',
        -- Highlight for item associated with checked checkbox
        scope_highlight = nil,
      },
    },
    html = {
      -- Turn on / off all HTML rendering
      enabled = true,
      comment = {
        -- Turn on / off HTML comment concealing
        conceal = false,
      },
    },
    -- Add custom icons lamw26wmal
    link = {
      image = vim.g.neovim_mode == 'skitty' and '' or '󰥶 ',
      custom = {
        youtu = { pattern = 'youtu%.be', icon = '󰗃 ' },
      },
    },
    heading = {
      sign = false,
      -- icons = {},
      icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
      backgrounds = {
        'Headline1Bg',
        'Headline2Bg',
        'Headline3Bg',
        'Headline4Bg',
        'Headline5Bg',
        'Headline6Bg',
      },
      foregrounds = {
        'Headline1Fg',
        'Headline2Fg',
        'Headline3Fg',
        'Headline4Fg',
        'Headline5Fg',
        'Headline6Fg',
      },
    },
  },
  config = function(_, opts)
    require('render-markdown').setup(opts)
    Snacks.toggle({
      name = 'Render Markdown',
      get = function()
        return require('render-markdown.state').enabled
      end,
      set = function(enabled)
        local m = require 'render-markdown'
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end,
    }):map '<leader>um'
  end,
}
