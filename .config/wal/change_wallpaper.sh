#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

cd "$WALLPAPER_DIR" || { echo "Cannot access: $WALLPAPER_DIR"; exit 1; }

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 new_wallpaper_name.png"
    exit 1
fi

NEW_WALLPAPER="$1"

if [ ! -f "$NEW_WALLPAPER" ]; then
    echo "File: '$NEW_WALLPAPER', does not exits in: $(pwd)"
    exit 1
fi


if [ -f "current.png" ]; then
	RANDOM_STR=$(head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 8)
    	mv "current.png" "wallpaper-${RANDOM_STR}.png"
fi

mv "$NEW_WALLPAPER" "current.png"


pkill hyprpaper && hyprctl dispatch exec hyprpaper
wal -i "$(pwd)/current.png"

