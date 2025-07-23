local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Jetbrains Mono")
config.color_scheme = "Catppuccin Frappe"
config.enable_wayland = false

return config
