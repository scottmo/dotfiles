#!/usr/bin/env sh

#
# asdf
#
if [ -d "$HOME/.asdf/" ]; then
    source "$(brew --prefix asdf)/asdf.sh"
fi

#
# fnm
#
if [ -d "$HOME/.fnm" ]; then
    eval "$(fnm env)"
fi

#
# rust
#
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
