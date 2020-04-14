#!/usr/bin/env bash

function __parse_git_branch {
    is_git_dirty=`[[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"`
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$is_git_dirty/"
}
function __prompt_status {
    local symbols=()

    [[ $RETVAL -ne 0 ]] && symbols+="\[\e[1;31m\](╯°□°）╯︵ ┻━┻" # bad result
    [[ $UID -eq 0 ]] && symbols+="⚡"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="\[\e[1;36m\]⚙"

    echo -n "$symbols"
}
function __theme_simple {
    # $ - path >>>
    local arrow="\[\e[1;34m\]>\[\e[1;33m\]>\[\e[1;31m\]>\e[0m "
    local dir=$(basename $(dirname $PWD))/$(basename $PWD)
    PS1="\[\e[1;34m\]- $dir $arrow"
}
function __theme_momo {
    # <[ path ]> git_branch dirty
    # $
    local dir="\[\e[1;32m\]<[ \w ]>\e[0m"
    PS1="$dir \[\e[1;36m\]\$(__parse_git_branch)\[\e[1;34m\]\n\$ "
}
function __highlight_command {
    PS1="$PS1\[\e[1;43m\]\[\e[1;30m\]"
    PS0="\e[0m"
}
function __bold_command {
    PS1="\[\e[1m\]$PS1"
}
function __prompt_command {
    RETVAL=$?
    __prompt_status
    __theme_momo
    # __theme_simple
    __bold_command
    __highlight_command
    echo -ne "\033]0;${PWD##*/}\007" # set title to current folder name
}

PROMPT_COMMAND=__prompt_command
