local wezterm = require("wezterm")

return {
	font = wezterm.font({
		family = "JetBrains Mono",
	}),
	font_size = 16,
	enable_tab_bar = false,
	color_scheme = "Tokyo Night",
	enable_wayland = false,
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
