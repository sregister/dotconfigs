# Niri Desktop Backup

This directory backs up the CachyOS niri desktop setup.

- `configs/niri/` contains the niri config. It starts Noctalia with `spawn-at-startup "noctalia" "--daemon"`.
- `configs/home/scott/.config/noctalia/` contains Noctalia config/palettes. Noctalia is the preferred desktop shell.
- `configs/home/scott/.config/waybar/` contains Waybar config as a fallback/alternate bar setup.
- `wallpapers/` contains the wallpapers from `~/Pictures/wallpapers`.

To restore on another install, copy the relevant paths from `configs/home/scott/.config/` into `~/.config/`, copy `configs/niri/` into `~/.config/niri/`, and copy `wallpapers/` into `~/Pictures/wallpapers/`.
