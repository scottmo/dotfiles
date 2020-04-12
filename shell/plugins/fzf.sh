#!/usr/bin/env sh

if hash fzf 2>/dev/null; then
    if [ "$SHELL" = `which zsh` ]; then
        . ~/.fzf.zsh 
    elif [ "$SHELL" = `which bash` ]; then
        . ~/.fzf.bash
    fi

    if hash fd 2>/dev/null; then
        export FZF_DEFAULT_COMMAND='fd -L --type f'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd -L --type d .'
    fi
fi
