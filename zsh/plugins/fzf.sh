#!/usr/bin/env sh

! [ $(command -v fzf) ] && return 0

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

if [ $(command -v fd) ]; then
    export FZF_DEFAULT_COMMAND='fd -L --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd -L --type d .'
fi
