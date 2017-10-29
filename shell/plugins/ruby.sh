#!/usr/bin/env sh

# rbenv
if [ -d "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
else # use system default
    # install to the following path, no more sudo
    alias gemi="gem install --user-install"
    alias gemu="gem update --user-install"

    export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
fi
