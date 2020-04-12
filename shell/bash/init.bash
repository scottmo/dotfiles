#!/usr/bin/env bash
# vim: fdm=marker foldmarker={{{,}}} foldlevel=1

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
# exports {{{
    export HISTCONTROL='ignoredups:erasedups:ignorespace'
    export HISTSIZE='5000'
# }}}
# theme {{{
    TXTRESET="\e[0m"

    function __parse_git_branch {
        is_git_dirty=`[[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"`
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$is_git_dirty/"
    }
    function __sadface {
        [ $? != 0 ] && echo -e "\e[0;31m\xE2\x98\xB9"
    }
    function __theme_simple {
        # $ - path >>>
        dir=$(basename $(dirname $PWD))/$(basename $PWD)
        PS1="\[\e[1;34m\]- \[\e[1;31m\]$dir >\[\e[1;33m\]>\[\e[1;32m\]> \[${TXTRESET}\]"
    }
    function __theme_momo {
        # <[ path ]> git_branch dirty
        # $
        PS1="\n\[\e[1;33m\]<[ \[\e[1;32m\]\w\[\e[1;33m\] ]> \[\e[1;35m\]\$(__parse_git_branch)\[\e[1;34m\]\n\$ \[${TXTRESET}\]"
    }
    function __prompt_command {
        __sadface
        # __theme_momo
        __theme_simple
    }

    PROMPT_COMMAND=__prompt_command
# }}}
source "$HOME/dotfiles/shell/base.sh"
