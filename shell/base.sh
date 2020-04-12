#!/usr/bin/env sh

export DOTFILES=$HOME/dotfiles

export PATH="$HOME/bin:$DOTFILES/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# plugins
for file in $DOTFILES/shell/plugins/*.sh; do
    . $file
done
unset file
