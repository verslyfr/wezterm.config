# WezTerm Configuration

This repository contains my personal configuration for [WezTerm](https://wezfurlong.org/wezterm/).

## Setup

1. Clone this repository.
2. Create the configuration directory and link the file:
   ```bash
   mkdir -p ~/.config/wezterm
   ln -s ~/OneDrive/src/wezterm.config/wezterm.lua ~/.config/wezterm/wezterm.lua
   ```
## Launching from WSL 2

So there are issues with wezterm, window decorations, and WSL. The best
solution I figured out was to run it using X by setting the WAYLAND_DISPLAY to
nothing before launching wezterm.

```shell
"C:\Program Files\WSL\wslg.exe" -d openSUSE-Tumbleweed --cd "~" -- WAYLAND_DISPLAY= wezterm
```
