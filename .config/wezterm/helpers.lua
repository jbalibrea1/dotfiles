-- I am helpers.lua and I should live in ~/.config/wezterm/helpers.lua

local wezterm = require 'wezterm'

-- This is the module table that we will export
local module = {}

-- define a function in the module table.
-- Only functions defined in `module` will be exported to
-- code that imports this module.
-- The suggested convention for making modules that update
-- the config is for them to export an `apply_to_config`
-- function that accepts the config object, like this:
function module.apply_to_config(config)
  -- theme
  config.color_scheme = 'Tokyo Night Moon' -- Catppuccin Mocha

  -- font
  config.font = wezterm.font { family = 'Fira Code' } -- JetBrains Mono, Iosevka, Fira Code, Hack
  config.font_size = 12.0

  -- UI
  config.enable_tab_bar = true
  config.window_background_opacity = 0.9 -- opacity as you please
  config.kde_window_background_blur = true
  config.hide_tab_bar_if_only_one_tab = true
  config.use_fancy_tab_bar = false
  config.animation_fps = 1
  config.cursor_blink_ease_in = 'Constant'
  config.cursor_blink_ease_out = 'Constant'
  config.default_cursor_style = 'BlinkingBar'
  config.force_reverse_video_cursor = true
  -- config.window_decorations = 'RESIZE'
  config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

  config.underline_thickness = 3
  config.cursor_thickness = 3
  config.underline_position = -6
  config.enable_kitty_graphics = true

  -- binds
  -- config.leader = { key = 'a', mods = 'CTRL' }
  config.keys = {
    { key = 'c', mods = 'LEADER', action = wezterm.action { SpawnTab = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER', action = wezterm.action { ActivatePaneDirection = 'Left' } },
    { key = 'j', mods = 'LEADER', action = wezterm.action { ActivatePaneDirection = 'Down' } },
    { key = 'k', mods = 'LEADER', action = wezterm.action { ActivatePaneDirection = 'Up' } },
    { key = 'l', mods = 'LEADER', action = wezterm.action { ActivatePaneDirection = 'Right' } },
    { key = 't', mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'DefaultDomain' },
  }
end

-- return our module table
return module
