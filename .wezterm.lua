local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Afterglow'

-- config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', { weight = 'Bold' })
-- config.font = wezterm.font('Iosevka Nerd Font Mono', { weight = 'Bold'})
config.font = wezterm.font('MartianMono Nerd Font', { weight = 'Regular'})

config.font_size = 13

config.enable_kitty_graphics = true

return config
