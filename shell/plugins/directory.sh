#!/usr/bin/env sh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export LSCOLORS='Gxfxcxdxdxegedabagacad'
alias ls='ls -hF --color=auto'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -la'
alias lsall='ls -1d $(find .)'
alias lsdir='echo `ls -l | grep "^d" | awk "{ print $9 }" | tr -d "/"`'

up () {
    DEEP=$1
    [ -z "${DEEP}" ] && { DEEP=1; }
    for i in $(seq 1 ${DEEP}); do
        cd ../
    done
}

cmkdir () {
    mkdir -p "$1";cd "$1";
}
