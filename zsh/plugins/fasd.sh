#!/usr/bin/env sh

! [ $(command -v fasd) ] && return 0

eval "$(fasd --init auto)"

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

alias z='fasd_cd -d'
unalias sf
