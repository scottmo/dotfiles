#!/usr/bin/env bash

# tput colors, setaf - fg, setab - bg
# 0 – Black
# 1 – Red
# 2 – Green
# 3 – Yellow
# 4 – Blue
# 5 – Magenta
# 6 – Cyan
# 7 – White

PROMPT_ARROW="$(tput setaf 4)>$(tput setaf 3)>$(tput setaf 1)>$(tput sgr0) "

function __parse_git_branch {
    is_git_dirty=`[[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"`
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$is_git_dirty/"
}
function __prompt_status {
    local symbols=()

    [[ $RETVAL -ne 0 ]] && symbols+="$(tput setaf 1)(╯°□°）╯︵ ┻━┻" # bad result
    [[ $UID -eq 0 ]] && symbols+="⚡"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="$(tput setaf 6)⚙"

    echo -n "$symbols"
}
function __theme_simple {
    # $ - path >>>
    local dir=$(basename $(dirname $PWD))/$(basename $PWD)
    PS1="$(tput bold)$(tput setaf 4)- $dir $PROMPT_ARROW"
}
function __theme_momo {
    # <[ path ]> git_branch dirty
    # $
    local dir="$(tput setaf 2)<[ \w ]>$(tput sgr0)"
    PS1="$(tput bold)$dir $(tput setaf 6)\$(__parse_git_branch)$(tput setaf 4)\n\$ "
}
function __highlight_command {
    PS1="$PS1$(tput setab 3)$(tput setaf 0)"
    PS0="$(tput sgr0)"
}
function __prompt_command {
    RETVAL=$?
    __prompt_status
    __theme_momo
    # __theme_simple
    __highlight_command
    echo -ne "\033]0;${PWD##*/}\007" # set title to current folder name
}

PROMPT_COMMAND=__prompt_command
