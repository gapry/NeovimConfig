#!/bin/sh

TARGET="$HOME/.config/nvim"

cp init.lua "$TARGET/"

rsync -av ./lua/ "$TARGET/lua/"
