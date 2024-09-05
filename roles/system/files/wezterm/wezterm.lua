local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'
config.enable_wayland = false

return config
