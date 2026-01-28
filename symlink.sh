#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TARGET_DIR="$HOME/.config"

# List of config directories
CONFIGS="fuzzel kitty mako niri nvim waybar"

mkdir -p "$TARGET_DIR"

for folder in $CONFIGS; do
    SOURCE="$SCRIPT_DIR/$folder"
    DEST="$TARGET_DIR/$folder"

    echo "Checking $folder..."

    if [ ! -d "$SOURCE" ]; then
        echo "Skipping: $folder not found in $SCRIPT_DIR"
        continue
    fi

    if [ -L "$DEST" ]; then
        echo "Updating existing symlink..."
        ln -snf "$SOURCE" "$DEST"
    elif [ -d "$DEST" ]; then
        BACKUP="${DEST}_$(date +%Y%m%d_%H%M%S).bak"
        echo "Existing directory found! Backing up to $BACKUP"
        mv "$DEST" "$BACKUP"
        ln -s "$SOURCE" "$DEST"
    else
        echo "Creating new symlink..."
        ln -s "$SOURCE" "$DEST"
    fi
done

echo "Your .config is now linked to your repo at $SCRIPT_DIR."
