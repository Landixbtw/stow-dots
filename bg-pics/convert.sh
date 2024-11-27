#!/bin/bash
# Directory containing your wallpapers
SRC_DIR=~/bg-pics/wallpapers/
DEST_DIR=~/bg-pics/wallpapers_png
# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"
# Find all JPG files and convert them to PNG
find "$SRC_DIR" -type f -name "*.jpg" | while read -r img; do
    # Create subdirectories in the destination as needed
    subdir=$(dirname "$img" | sed "s|$SRC_DIR|$DEST_DIR|")
    mkdir -p "$subdir"
    # Convert the file to PNG in the corresponding destination folder
    magick "$img" "$subdir/$(basename "${img%.jpg}.png")"
done
