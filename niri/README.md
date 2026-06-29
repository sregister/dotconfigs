# Niri Desktop Backup

This directory backs up the CachyOS niri desktop setup.

- `configs/niri/` contains the niri config. It starts Noctalia with `spawn-at-startup "noctalia" "--daemon"`.
- `configs/home/scott/.config/noctalia/` contains Noctalia config/palettes. Noctalia is the preferred desktop shell.
- `configs/home/scott/.config/waybar/` contains Waybar config as a fallback/alternate bar setup.
- `wallpapers/` contains the wallpapers from `~/Pictures/wallpapers`.

To restore on another install, copy the relevant paths from `configs/home/scott/.config/` into `~/.config/`, copy `configs/niri/` into `~/.config/niri/`, and copy `wallpapers/` into `~/Pictures/wallpapers/`.

On this machine, the active config directories are symlinked into this repo for live version control:

- `~/.config/niri` -> `~/repos/dotconfigs/niri/configs/niri`
- `~/.config/noctalia` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/noctalia`
- `~/.config/waybar` -> `~/repos/dotconfigs/waybar`
- `~/.config/fuzzel` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/fuzzel`
- `~/.config/rofi` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/rofi`
- `~/.config/ghostty` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/ghostty`
- `~/.config/alacritty` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/alacritty`
- `~/.config/btop` -> `~/repos/dotconfigs/niri/configs/home/scott/.config/btop`
