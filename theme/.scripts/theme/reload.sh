#!/bin/bash

DOTFILESDIR="$HOME/.dotfiles"
NAME=$(basename -- "$0")
ERR="$NAME - reload configuration files for various systems

Usage:
    $NAME [options]

options:
    -d, --desktop                reload desktop configuration files
    -l, --laptop                 reload laptop configuration files"

reload_desktop() {
    cat $DOTFILESDIR/i3/.config/i3/conf.d/*.conf > $DOTFILESDIR/i3/.config/i3/config
    cat $DOTFILESDIR/i3/.config/i3/config.desktop >> $DOTFILESDIR/i3/.config/i3/config
    cat $DOTFILESDIR/i3/.config/i3status/conf.d/*.conf > $DOTFILESDIR/i3/.config/i3status/config
    cat $DOTFILESDIR/i3/.config/i3status/config.desktop >> $DOTFILESDIR/i3/.config/i3status/config
    cat $DOTFILESDIR/polybar/.config/polybar/conf.d/*.conf > $DOTFILESDIR/polybar/.config/polybar/config
    cat $DOTFILESDIR/polybar/.config/polybar/config.desktop >> $DOTFILESDIR/polybar/.config/polybar/config
    cat $DOTFILESDIR/polybar/.config/polybar/launch.desktop.sh > $DOTFILESDIR/polybar/.config/polybar/launch.sh
}

reload_laptop() {
    cat $DOTFILESDIR/i3/.config/i3/conf.d/*.conf > $DOTFILESDIR/i3/.config/i3/config
    cat $DOTFILESDIR/i3/.config/i3/config.laptop >> $DOTFILESDIR/i3/.config/i3/config
    cat $DOTFILESDIR/i3/.config/i3status/conf.d/*.conf > $DOTFILESDIR/i3/.config/i3status/config
    cat $DOTFILESDIR/i3/.config/i3status/config.laptop >> $DOTFILESDIR/i3/.config/i3status/config
    cat $DOTFILESDIR/polybar/.config/polybar/conf.d/*.conf > $DOTFILESDIR/polybar/.config/polybar/config
    cat $DOTFILESDIR/polybar/.config/polybar/config.laptop >> $DOTFILESDIR/polybar/.config/polybar/config
    cat $DOTFILESDIR/polybar/.config/polybar/launch.laptop.sh > $DOTFILESDIR/polybar/.config/polybar/launch.sh
}

if [[ $# < 1 || $# > 1 ]] ;
    then
        echo "$ERR"
        exit 1
fi

case $1 in
    -d|--desktop)
        reload_desktop
        ;;
    -l|--laptop)
        reload_laptop
        ;;
    *)
        echo "$ERR"
        exit 1
        ;;
esac

exit 0
