#!/usr/bin/env bash

# import utils
source $DOTFILES_ROOT/shell/lib.sh

#
# install oh my zsh
#
if [ ! -d "~/.oh-my-zsh" ]; then
    confirm "Use oh my zsh as zsh framework?"
    if is_confirmed; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
fi
