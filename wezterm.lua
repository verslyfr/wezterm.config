local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ============================================================
-- Basic configuration
-- ============================================================
config.color_scheme = 'Alabaster'
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 10.0

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

wezterm.log_info("Configuration reloaded.")

-- ============================================================
-- Keybindings
-- ============================================================
config.keys = {
  {
    key = '|',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '_', -- Shift + -
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '0',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}
-- ============================================================
-- Final return
-- ============================================================
return config
