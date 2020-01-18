#!/bin/bash
WALLPAPERSDIR="$HOME/Pictures/.wallpaper"

shopt -s nullglob
shopt -s nocaseglob

for image in "$WALLPAPERSDIR"/*.{jpg,jpeg,png}
do
    echo "creating scheme for $(basename "$image")"
    wal -a "90" -n -s -q -t -e -i "$image"
done

shopt -u nocaseglob
shopt -u nullglob

echo "done"
exit 0