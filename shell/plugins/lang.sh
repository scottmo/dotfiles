#!/usr/bin/env sh

#
# asdf
#
if [ -d "$HOME/.asdf/" ]; then
    source ~/.asdf/asdf.sh
    
    if [ "$ZSH_NAME" = 'zsh' ]; then
        source ~/.asdf/completions/asdf.zsh
    elif [ "$BASH" = 'bash' ]; then
        source ~/.asdf/completions/asdf.bash
    fi
fi

#
# ruby
#
[ -d "$HOME/.rbenv/shims" ] && export PATH="$HOME/.rbenv/shims:$PATH"

#
# rust
#
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"

#
# node
#
[ -d "$HOME/n" ] && export N_PREFIX="$HOME/n" && export PATH="$N_PREFIX/bin:$PATH"
