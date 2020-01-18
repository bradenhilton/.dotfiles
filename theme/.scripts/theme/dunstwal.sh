#!/bin/bash

ln -sf "$HOME/.cache/wal/colors.dunstrc" "$HOME/.config/dunst/dunstrc"

pkill dunst
dunst &