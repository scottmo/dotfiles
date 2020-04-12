#!/usr/bin/env sh

# asdf {{{
    if [ -d "$HOME/.asdf/" ]; then
        . ~/.asdf/asdf.sh
        . ~/.asdf/completions/asdf.bash
    fi
# }}}
# node {{{
    if [ -d "$HOME/n" ]; then
        export N_PREFIX="$HOME/n";
        export PATH="$N_PREFIX/bin:$PATH"
    fi
# }}}
# ruby {{{
    if [ -d "$HOME/.rbenv/shims" ]; then
        export PATH="$HOME/.rbenv/shims:$PATH"
    fi

    alias gemi="gem install --user-install"
    alias gemu="gem update --user-install"
# }}}
# rust cargo {{{
    if [ -d "$HOME/.cargo/bin" ]; then
        export PATH="$HOME/.cargo/bin:$PATH"
    fi
# }}}
