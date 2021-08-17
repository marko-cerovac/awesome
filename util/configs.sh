#!/bin/sh

LOCAL_EDITOR='neovide'

CONFIGS=(
"alacritty - $HOME/.config/alacritty/alacritty.yml"
"awesome - $HOME/.config/awesome/rc.lua"
"qtile - $HOME/.config/qtile/config.py"
"neovim - $HOME/.config/nvim/init.lua"
"picom - $HOME/.config/picom/picom.conf"
"joshuto - $HOME/.config/joshuto/keymap.toml"
"rofi - $HOME/.config/rofi/config.rasi"
)

printf '%s\n' "${CONFIGS[@]}"
