#!/usr/bin/env sh

#
# exports, path, helper functions
#
export DOTFILES=$HOME/dotfiles
export PATH="$HOME/bin:$DOTFILES/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR=vim

# 
# aliases
# 
alias meow='cat $DOTFILES/shell/motd'
alias reload='exec $SHELL'

#
# source external files
#
source $DOTFILES/shell/lib.sh
try_source "$DOTFILES/shell/plugins" "sh"
try_source "$HOME/dotfiles/_local_" "sh"
