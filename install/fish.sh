#!/usr/bin/env sh

set -e # fail fast

if ! [ $(command -v fish) ]; then
    brew install fish
fi

fihser_path="$HOME/.config/fish/functions/fisher.fish"
if ! [ -f $fihser_path ]; then
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    ln -sf ~/dotfiles/shell/fish/fishfile ~/.config/fish/fishfile
    fish -c fisher
fi
