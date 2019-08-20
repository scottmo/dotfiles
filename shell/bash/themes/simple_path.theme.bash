#!/usr/bin/env bash

TXTRESET="\e[0m"
ERROR_C="\e[0;31m"
DASH_C="\e[1;34m"
ARROW_1_C="\e[1;31m"
ARROW_2_C="\e[1;33m"
ARROW_3_C="\e[1;32m"

__sadface() {
    [ $? != 0 ] && echo -e "${TXTRED}\xE2\x98\xB9"
}

__prompt_command() {
    __sadface
    dir=$(basename $(dirname $PWD))/$(basename $PWD)
    PS1="\[${DASH_C}\]- \[${ARROW_1_C}\]$dir >\[${ARROW_2_C}\]>\[${ARROW_3_C}\]> \[${TXTRESET}\]"
}

PROMPT_COMMAND=__prompt_command
