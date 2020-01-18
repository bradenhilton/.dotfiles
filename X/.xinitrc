systemctl --user import-environment DISPLAY
xrdb -merge $HOME/.Xresources
exec i3
