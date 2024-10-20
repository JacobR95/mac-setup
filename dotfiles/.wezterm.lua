local wezterm = require("wezterm")

-- This holds the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95
config.macos_window_background_blur = 15

config.color_scheme = '3024 (dark) (terminal.sexy)'

return config
