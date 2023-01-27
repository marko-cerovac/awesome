#!/bin/sh

# A simple script that prints the contents of ~/Pictures/Wallpapers/ and prompts them using dmenu
# when the user selects the wallpaper, the script moves it to ~/.config/awesome/wallpaper.jpg
# this applies the selected wallpaper to AwesomeWM
CHOICE=$(find $HOME/Pictures/Wallpapers -type f | sed 's/\/home\/marko\/Pictures\/Wallpapers\///' | dmenu -b -l 20 -p "Select Wallpaper")

cp $HOME/Pictures/Wallpapers/$CHOICE "$HOME/.config/awesome/wallpaper.jpg"

awesome-client "require('gears.wallpaper').maximized('/home/marko/.config/awesome/wallpaper.jpg',s,true)"
