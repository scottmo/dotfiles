#!/usr/bin/env sh

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export LSCOLORS='Gxfxcxdxdxegedabagacad'
alias ls='ls -hF'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -la'
alias lsdir='echo `ls -l | grep "^d" | awk "{ print $9 }" | tr -d "/"`'

# numFiles: Count of non-hidden files in current dir
alias numFiles='echo $(ls -1 | wc -l)'

# qfind: Quickly search for file
alias qfind="find . -name "

function cmkdir {
    mkdir -p "$1";cd "$1";
}


if ! type tree &> /dev/null; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi
