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

if command -v lsd &> /dev/null; then
    alias ls="lsd"
fi
