#!/usr/bin/env sh

if hash brew >/dev/null 2>&1; then

    if [ -f `brew --prefix`/sbin ]; then
        pathmerge "`brew --prefix`/sbin"
    fi

    pathmerge "`brew --prefix`/bin"
fi
