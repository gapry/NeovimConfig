#!/bin/bash

UPSTREAM="https://github.com/gapry/NeovimConfig/archive/refs/heads/main.tar.gz"

CURRENT_TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

TARGET_PATH="$HOME/.config/nvim"
BACKUP_PATH="$HOME/backup/nvim/$CURRENT_TIMESTAMP"
TMP_PATH="/tmp/neovim-config-$CURRENT_TIMESTAMP"

if [ -d "$TARGET_PATH" ]; then
  mkdir -p "$(dirname "$BACKUP_PATH")"
  if ! mv "$TARGET_PATH" "$BACKUP_PATH"; then 
    echo "Failed to backup" 
    exit 1
  fi
fi

mkdir -p "$TMP_PATH"
if ! curl -sL "$UPSTREAM" -o "$TMP_PATH/main.tar.gz"; then 
  echo "Failed to download" 
  rm -rf "$TMP_PATH"
  exit 1 
fi

mkdir -p "$TARGET_PATH"
if ! tar -xzf "$TMP_PATH/main.tar.gz" -C "$TARGET_PATH" --strip-components=1; then
  echo "Failed to extract"
  rm -rf "$TMP_PATH"
  exit 1
fi

rm -rf "$TMP_PATH"
rm -f "$TARGET_PATH/.stylua.toml"
rm -rf "$TARGET_PATH/utils"

