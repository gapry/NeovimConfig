#!/bin/sh

if ! command -v nvim >/dev/null 2>&1; then
  echo "[ERROR] nvim not found"
  exit 0
fi

echo "Install and sync plugins..."
nvim --headless "+Lazy! sync" +qa

echo "Install and update treesitter parsers..."
nvim --headless \
  "+lua require('nvim-treesitter.install').ensure_installed_sync()" \
  "+TSUpdateSync" +qa
