#!/usr/bin/env sh

export dotfiles=$HOME/dotfiles
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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
# }}}
# rust cargo {{{
    if [ -d "$HOME/.cargo/bin" ]; then
        export PATH="$HOME/.cargo/bin:$PATH"
    fi
# }}}
