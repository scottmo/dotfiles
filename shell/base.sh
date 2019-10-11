#!/usr/bin/env sh

#
# exports, path, helper functions
#
export DOTFILES=$HOME/dotfiles

#
# source external files
#
. $DOTFILES/shell/lib.sh
for file in $DOTFILES/shell/plugins/*.sh; do
    . $file
done

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

for file in $DOTFILES/_local_/*.sh; do
    . $file
done

