#!/bin/bash

DIR="$HOME/.wallpaper"
WALLPAPER=$(ls $DIR/* | shuf -n 1)
# feh --bg-scale "$WALLPAPER"

wal -a "90" -i "$WALLPAPER"