local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Basic configuration
config.color_scheme = 'Batman'
config.font = wezterm.font 'Hack Nerd Font'

-- Default to WSL
config.default_prog = { 'wsl.exe' }

-- Launch Menu
config.launch_menu = {
  {
    label = 'Git Bash',
    args = { 'C:\\Users\\versl\\scoop\\apps\\git\\current\\bin\\bash.exe', '-l' },
  },
  {
    label = 'PowerShell 7',
    args = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' },
  },
}

return config