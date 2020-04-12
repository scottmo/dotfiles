#!/usr/bin/env sh

source "$HOME/dotfiles/shell/plugins/fasd"

# function to execute built-in cd
fasd_cd() {
    if [ $# -le 1 ]; then
        fasd "$@"
    else
        local _fasd_ret="$(fasd -e 'printf %s' "$@")"
        [ -z "$_fasd_ret" ] && return
        [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
    fi
}

alias a='fasd -a'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias d='fasd -d'
alias f='fasd -f'
alias v='f -e vim -b viminfo'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
