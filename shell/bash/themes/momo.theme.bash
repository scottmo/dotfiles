#!/usr/bin/env bash

TXTRESET="\e[0m"
ERROR_C="\e[0;31m"
PATH_BRACKET_C="\e[1;33m"
PATH_C="\e[1;32m"
GIT_BRANCH_C="\e[1;35m"
PROMPT_$="\e[1;34m"

__parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

__parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(__parse_git_dirty)/"
}

__sadface() {
    [ $? != 0 ] && echo -e "${ERROR_C}\xE2\x98\xB9"
}

__prompt_command() {
    __sadface
    PS1="\n\[${PATH_BRACKET_C}\]<[ \[${PATH_COLOR}\]\w\[${PATH_BRACKET_C}\] ]> \[${GIT_BRANCH_C}\]\$(__parse_git_branch)\[${PROMPT_$}\]\n\$ \[${TXTRESET}\]"
}

PROMPT_COMMAND=__prompt_command

