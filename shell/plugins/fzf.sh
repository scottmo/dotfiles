#!/usr/bin/env sh

if [ -d ~/.fzf ]; then
    if [ "$SHELL" = 'zsh' ]; then
        try_source ~/.fzf.zsh 
    elif [ "$SHELL" = 'bash' ]; then
        try_source ~/.fzf.bash
    fi

    export FZF_DEFAULT_COMMAND='fd -L --type f --color=never'
    export FZF_ALT_C_COMMAND='fd -L --type d . --color=never'
fi
