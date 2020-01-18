alias ls='ls --color=auto'

export VISUAL=code
export EDITOR=nvim

eval "$(starship init bash)"

(cat $HOME/.cache/wal/sequences &)
source $HOME/.cache/wal/colors-tty.sh