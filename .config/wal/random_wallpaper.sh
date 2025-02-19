#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
cd "$WALLPAPER_DIR" || { echo "Cannot access: $WALLPAPER_DIR"; exit 1; }

old_wallpaper=""
if [ -f "current.png" ]; then
    RANDOM_STR=$(head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 8)
    old_wallpaper="wallpaper-${RANDOM_STR}.png"
    mv "current.png" "$old_wallpaper"
fi

shopt -s nullglob

all_wallpapers=( *.png )

candidates=()
for file in "${all_wallpapers[@]}"; do
    if [ "$file" != "current.png" ] && [ "$file" != "$old_wallpaper" ]; then
        candidates+=("$file")
    fi
done

if [ ${#candidates[@]} -eq 0 ]; then
    echo "No wallpapers to choose"
    exit 1
fi

random_index=$(( RANDOM % ${#candidates[@]} ))
selected_wallpaper="${candidates[$random_index]}"

mv "$selected_wallpaper" "current.png"

pkill hyprpaper && hyprctl dispatch exec hyprpaper
wal -i "$(pwd)/current.png"

