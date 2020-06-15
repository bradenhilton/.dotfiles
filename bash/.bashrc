alias ls='ls --color=auto'

export EDITOR=nvim
export VISUAL=code

eval "$(starship init bash)"

(cat $HOME/.cache/wal/sequences &)
source $HOME/.cache/wal/colors-tty.sh
