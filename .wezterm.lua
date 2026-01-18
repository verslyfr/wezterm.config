local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Basic configuration
config.color_scheme = 'Batman'
config.font = wezterm.font 'JetBrains Mono'

return config
