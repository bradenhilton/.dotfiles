if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
# Created by `userpath` on 2020-02-01 15:42:44
export PATH="$PATH:/home/<username>/.local/bin"
