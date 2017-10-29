#!/usr/bin/env bash

# Colors {{{
    bold=$(tput bold)
    underline=$(tput sgr 0 1)
    reset=$(tput sgr0)

    purple=$(tput setaf 171)
    red=$(tput setaf 1)
    green=$(tput setaf 76)
    tan=$(tput setaf 3)
    blue=$(tput setaf 38)
# }}}

# Ouput functions {{{
    e_header() {
        printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
    }
    e_arrow() {
        printf "➜ $@\n"
    }
    e_success() {
        printf "${green}✔ %s${reset}\n" "$@"
    }
    e_error() {
        printf "${red}✖ %s${reset}\n" "$@"
    }
    e_warning() {
        printf "${tan}➜ %s${reset}\n" "$@"
    }
    e_info() {
        printf "  [ \033[00;34m..\033[0m ] $1\n"
    }
    e_underline() {
        printf "${underline}${bold}%s${reset}\n" "$@"
    }
    e_bold() {
        printf "${bold}%s${reset}\n" "$@"
    }
    e_note() {
        printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
    }
    e_line() {
        printf "--------------------------------------------------\n"
    }
# }}}

# User Interaction {{{
    confirm() {
        printf "\n${bold}$@${reset}"
        read -p "(y/n) " -n 1
        printf "\n"
    }

    # Test whether the result of an 'ask' is a confirmation
    is_confirmed() {
        [[ "$REPLY" =~ ^[Yy]$ ]] && return 0
        return 1
    }

    ask() {
        printf "\r  [ \033[0;33m?\033[0m ] $1 \n"
        read -e
    }
# }}}

# Test {{{
    has_command() {
        hash $1 2>/dev/null && return 0
        return 1
    }

    is_os() {
        [[ "${OSTYPE}" == $1* ]] && return 0
        return 1
    }
# }}}

# Utils {{{
    pathmerge() {
        if [ -z "$1" ]; then
            e_header 'Usage:'
            e_arrow 'pathmerge /path/to/dir => PATH=/path/to/dir:$PATH'
            e_arrow 'pathmerge /path/to/dir after => PATH=$PATH:/path/to/dir'
        else
            if ! [[ $PATH =~ (^|:)$1($|:) ]] ; then
                if [ "$2" = "after" ] ; then
                    export PATH=$PATH:$1
                else
                    export PATH=$1:$PATH
                fi
            fi
        fi
    }

    pathremove() {
        export PATH=$(echo $PATH | sed -e "s;:$1;;;")
    }

    try_source() {
        if [ ! -z "$2" ]; then
            for file in $1/*.$2; do
                [ -f "$file" ] && source $file
            done
        elif [ -f "$1" ]; then
            [ -f "$1" ] && source "$1"
        fi
    }
# }}}
