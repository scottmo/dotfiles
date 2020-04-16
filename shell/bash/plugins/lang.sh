#!/usr/bin/env sh

# asdf {{{
    if [ -d "$HOME/.asdf/" ]; then
        . ~/.asdf/asdf.sh
        . ~/.asdf/completions/asdf.bash
    fi
# }}}
