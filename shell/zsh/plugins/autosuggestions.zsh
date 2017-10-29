#!/usr/bin/env zsh

file='/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
if [[ -a "$file" ]]; then
    source "$file"
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
fi
unset file
