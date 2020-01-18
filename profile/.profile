# eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Input
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx

export EDITOR=nvim
export TERMINAL=kitty
export TERM=xterm-kitty
export VISUAL=code

export XDG_CONFIG_HOME=$HOME/.config

export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=nvidia