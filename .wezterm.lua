local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Afterglow'

config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Bold' })


config.font_size = 14




return config
