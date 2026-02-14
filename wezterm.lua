local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ============================================================
-- Basic configuration
-- ============================================================
config.color_scheme = 'Wombat'
config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 10.0

if wezterm.target_triple:find("windows") then
  -- Running WezTerm on Windows ? launching WSL
  config.default_prog = { "wsl.exe", "--cd", "~" }
else
  -- Running WezTerm inside Linux
  config.default_prog = { os.getenv("SHELL") or "/bin/bash" }
  config.default_cwd = wezterm.home_dir
end

-- Launch Menu
config.launch_menu = {
  {
    label = 'Git Bash',
    args = { 'bash.exe', '-l' },
  },
  {
    label = 'PowerShell 7',
    args = { 'pwsh.exe' },
    cwd = '/mnt/c/Users/versl/',
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
-- Window Title
-- ============================================================
wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ""
  if tab.active_pane.is_zoomed then
    zoomed = "[Z] "
  end

  local index = ""
  if #tabs > 1 then
    index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title .. " - WezTerm"
end)

-- ============================================================
-- Local Configuration Override
-- ============================================================
local local_config_path = wezterm.config_dir .. "/wezterm.local.lua"
local f = io.open(local_config_path, "r")
if f then
  f:close()
  -- pcall ensures a crash in local config doesn't break WezTerm completely
  local success, local_module = pcall(dofile, local_config_path)

  if success then
    if type(local_module) == "table" then
      -- Mode 1: Simple table merge
      for k, v in pairs(local_module) do
        config[k] = v
      end
    elseif type(local_module) == "function" then
      -- Mode 2: Full programmatic control
      local_module(config, wezterm)
    end
    wezterm.log_info("Loaded local configuration: " .. local_config_path)
  else
    wezterm.log_error("Error loading local configuration: " .. tostring(local_module))
  end
end

-- ============================================================
-- Final return
-- ============================================================
return config
