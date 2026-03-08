#!/bin/bash

UPSTREAM="https://github.com/gapry/NeovimConfig/archive/refs/heads/main.tar.gz"

CURRENT_TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

TARGET_PATH="$HOME/.config/nvim"
BACKUP_PATH="$HOME/backup/nvim/$CURRENT_TIMESTAMP"
TMP_PATH="/tmp/neovim-config-$CURRENT_TIMESTAMP"

if [ -d "$TARGET_PATH" ]; then
  mkdir -p "$(dirname "$BACKUP_PATH")"
  mv "$TARGET_PATH" "$BACKUP_PATH"
fi

mkdir -p "$TMP_PATH"
curl -sL "$UPSTREAM" -o "$TMP_PATH/main.tar.gz"

mkdir -p "$TARGET_PATH"
tar -xzf "$TMP_PATH/main.tar.gz" -C "$TARGET_PATH" --strip-components=1

rm -rf "$TMP_PATH"
rm -f "$TARGET_PATH/install.sh"
rm -rf "$TARGET_PATH/utils"
