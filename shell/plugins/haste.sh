#!/usr/bin/env sh

if hash haste 2>/dev/null; then
    gethaste() {
        if [ ! -z "$1" ]; then
            if [ `uname` = 'Darwin' ]; then
                if [ "$1" = "copy" ]; then
                    pbpaste | haste | pbcopy
                else
                    cat $1 | haste | pbcopy
                fi
            else
                cat $1 | haste
            fi
        fi
    }
fi
