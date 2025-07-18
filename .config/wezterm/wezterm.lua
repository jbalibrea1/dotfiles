local wezterm = require 'wezterm'

local helpers = require 'helpers'
local keys = require 'keys'
local config = wezterm.config_builder()

helpers.apply_to_config(config)
keys.setup(config)

return config
