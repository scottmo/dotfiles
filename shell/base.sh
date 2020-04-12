#!/usr/bin/env sh

export dotfiles=$HOME/dotfiles

export PATH="$HOME/bin:$dotfiles/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# plugins
for file in $dotfiles/shell/plugins/*.sh; do
    . $file
done
unset file
