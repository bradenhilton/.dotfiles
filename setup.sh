#!/bin/bash

DOTFILESDIR="$HOME/.dotfiles"
NAME=$(basename -- "$0")
FIREFOXDIR="$HOME/.mozilla/firefox"
RELOAD="$HOME/.dotfiles/theme/.scripts/theme/reload.sh"
PACKAGES="antibody bash code chrome dunst fcitx fish fontconfig i3 jetbrains-toolbox kitty mpd mpv nano ncmpcpp neovim picom polybar profile pulseeffects ranger redshift rofi termite theme urserver vim wal www X youtube-dl zsh"
ERR="$NAME - setup config files per system

Usage:
    $NAME [options]

options:
    -d, --desktop                setup for desktop
    -l, --laptop                 setup for laptop
    -u, --unstow                 uninstall"

stow_main() {
    echo "stowing main packages"
    stow -v -d $DOTFILESDIR -R -t $HOME $PACKAGES
}

stow_firefox() {
    if [ ! -d "$FIREFOXDIR" ] ;
        then
            timeout -k 2 2s firefox -headless > /dev/null 2>&1 # open firefox to create profile directory, then close
    fi

    if [ ! -f "$FIREFOXDIR/installs.ini" ] ;
        then
            echo "unable to find "$FIREFOXDIR"/installs.ini"
            exit 1
    fi

    PROFILEPATH="$(grep 'Default=' "$FIREFOXDIR/installs.ini" | sed s/^Default=//)"

    if [ -d "$FIREFOXDIR/$PROFILEPATH" ] ;
        then
            echo "stowing firefox in $PROFILEPATH"
            stow -v -d $DOTFILESDIR -R -t "$FIREFOXDIR/$PROFILEPATH" firefox
            exit 0
    fi

    if [ -d "$PROFILEPATH" ] ;
        then
            echo "stowing firefox in $PROFILEPATH"
            stow -v -d $DOTFILESDIR -R -t "$PROFILEPATH" firefox
            exit 0
    fi

    echo "unable to find profile"
    exit 1
}

unstow_main() {
    stow -v -d $DOTFILESDIR -D -t $HOME $PACKAGES
}

unstow_firefox() {
    if [ ! -f "$FIREFOXDIR/installs.ini" ] ;
        then
            echo "unable to find "$FIREFOXDIR"/installs.ini"
            exit 1
    fi

    PROFILEPATH="$(grep 'Default=' "$FIREFOXDIR/installs.ini" | sed s/^Default=//)"

    if [ -d "$FIREFOXDIR/$PROFILEPATH" ] ;
        then
            echo "unstowing firefox from $PROFILEPATH"
            stow -v -d $DOTFILESDIR -D -t "$FIREFOXDIR/$PROFILEPATH" firefox
            exit 0
    fi

    if [ -d "$PROFILEPATH" ] ;
        then
            echo "unstowing firefox from $PROFILEPATH"
            stow -v -d $DOTFILESDIR -D -t "$PROFILEPATH" firefox
            exit 0
    fi

    echo "unable to find profile"
    exit 1
}

if [[ $# < 1 || $# > 1 ]] ;
    then
        echo "$ERR"
        exit 1
fi

case $1 in
    -d|--desktop)
        ("$RELOAD" -d)
        stow_main
        stow_firefox
        ;;
    -l|--laptop)
        ("$RELOAD" -l)
        stow_main
        stow_firefox
        ;;
    -u|--uninstall)
        unstow_main
        unstow_firefox
        ;;
    *)
        echo "$ERR"
        exit 1
        ;;
esac

exit 0
