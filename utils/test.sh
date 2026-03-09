#!/bin/sh

TARGET="$HOME/.config/nvim"

cp ./nvim/init.lua "$TARGET/"

rsync -av ./nvim/lua/ "$TARGET/lua/"
