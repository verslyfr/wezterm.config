# WezTerm Configuration

This repository contains my personal configuration for [WezTerm](https://wezfurlong.org/wezterm/).

## Setup

1. Clone this repository.
2. Create the configuration directory and link the file:
   ```bash
   mkdir -p ~/.config/wezterm
   ln -s ~/OneDrive/src/wezterm.config/wezterm.lua ~/.config/wezterm/wezterm.lua
```
"C:\Program Files\WSL\wslg.exe" -d openSUSE-Tumbleweed --cd "~" -- WAYLAND_DISPLAY= wezterm
```

## Window Title

The configuration includes a `format-window-title` event handler that ensures the window title always contains ` - WezTerm`. This makes it easier to find and control the WezTerm window using tools like AutoHotkey on Windows.

The title format is: `[Z] [Tab Index/Count] Pane Title - WezTerm`
- `[Z]`: Indicates if the current pane is zoomed.
- `[1/3]`: Indicates the current tab index (if more than one tab exists).

## Keybindings

| Key Combination | Action |
|-----------------|--------|
| `CTRL` + `SHIFT` + `\|` | Split Pane Horizontally |
| `CTRL` + `SHIFT` + `_` | Split Pane Vertically |
| `CTRL` + `SHIFT` + `0` | Close Current Pane |

## Local Configuration

You can create a `wezterm.local.lua` file in the same directory as `wezterm.lua` to override settings locally. This file is git-ignored.

It supports two modes:

### 1. Simple Table Override
Return a table to overwrite specific keys.
```lua
return {
  font_size = 14.0,
  color_scheme = 'Dracula',
}
```

### 2. Advanced Function Override
Return a function to execute logic. The function receives the `config` object and the `wezterm` module.
```lua
return function(config, wezterm)
  config.font_size = 12.0
  
  if wezterm.target_triple:find("windows") then
    config.default_prog = {"powershell.exe"}
  end
end
```
