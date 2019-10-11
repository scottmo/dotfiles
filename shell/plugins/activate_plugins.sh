#!/usr/bin/env sh

# fzf
if hash fzf 2>/dev/null; then
    if [ "$SHELL" = 'zsh' ]; then
        . ~/.fzf.zsh 
    elif [ "$SHELL" = 'bash' ]; then
        . ~/.fzf.bash
    fi

    export FZF_DEFAULT_COMMAND='fd -L --type f --color=never'
    export FZF_ALT_C_COMMAND='fd -L --type d . --color=never'
fi
