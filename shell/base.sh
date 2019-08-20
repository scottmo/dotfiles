#!/usr/bin/env sh

#
# exports, path, helper functions
#
export DOTFILES=$HOME/dotfiles
export PATH="$HOME/bin:$DOTFILES/bin:$PATH"

#
# source external files
#
source $DOTFILES/shell/lib.sh
for file in $DOTFILES/shell/plugins/*.sh; do
    source "$file"
done
for file in $HOME/dotfiles/_local_/*.sh; do
    source "$file"
done
