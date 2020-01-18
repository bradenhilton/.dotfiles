alias ls='ls --color=auto'

ENABLE_CORRECTION="true"
DISABLE_AUTO_UPDATE="true"

[ -f $HOME/.zsh_plugins.sh ] && source $HOME/.zsh_plugins.sh

export VISUAL=code
export EDITOR=nvim

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

(cat $HOME/.cache/wal/sequences &)
source $HOME/.cache/wal/colors-tty.sh