#!/bin/bash

# 1. Read the current wallpaper from waypaper's config
current_wp=$(grep "^wallpaper =" ~/.config/waypaper/config.ini | cut -d '=' -f 2 | xargs)

# 2. Define where the cached lock screen image goes
cache_img=~/.cache/lockscreen/lock.png

# 3. (Optional Optimization) check if the cache is already up to date
# This prevents re-converting if the wallpaper hasn't changed since last lock
if [ ! -f "$cache_img" ] || [ "$current_wp" -nt "$cache_img" ]; then
    mkdir -p ~/.cache/lockscreen
    convert "$current_wp" -resize '1920x1200^' -gravity center -extent '1920x1200' "$cache_img"
fi

# 4. Lock the screen
hyprlock
