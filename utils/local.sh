#!/bin/sh

TARGET="$HOME/.config/nvim"

if [ ! -d "${TARGET}" ]; then
  mkdir -p "${TARGET}"
fi

cp ./nvim/init.lua "$TARGET/"

rsync -av ./nvim/lua/ "$TARGET/lua/"
rsync -av ./nvim/lsp/ "$TARGET/lsp/"
