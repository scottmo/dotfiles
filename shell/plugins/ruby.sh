#!/usr/bin/env sh

# rbenv
if [ -d "$HOME/.rbenv/bin" ]; then
    local rubypath="$HOME/.rbenv/bin"
    [[ :$PATH: == *":$rubypath:"* ]] || PATH="$rubypath:$PATH"
    eval "$(rbenv init -)"
else # use system default
    # install to the following path, no more sudo
    alias gemi="gem install --user-install"
    alias gemu="gem update --user-install"

    local rubypath="$HOME/.gem/ruby/2.0.0/bin"
    [[ :$PATH: == *":$rubypath:"* ]] || PATH="$rubypath:$PATH"
fi
