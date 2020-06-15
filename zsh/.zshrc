alias ls='ls --color=auto'

ENABLE_CORRECTION="true"
DISABLE_AUTO_UPDATE="true"

[ -f $HOME/.zsh_plugins.sh ] && source $HOME/.zsh_plugins.sh

export EDITOR=nvim
export VISUAL=code

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

(cat $HOME/.cache/wal/sequences &)
source $HOME/.cache/wal/colors-tty.sh

# Created by `userpath` on 2020-02-01 15:42:44
export PATH="$PATH:/home/<username>/.local/bin"
