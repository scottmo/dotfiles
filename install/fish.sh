#!/usr/bin/env sh

set -e # fail fast

if ! [ $(command -v fish) ]; then
    brew install fish
fi

fihser_path="$HOME/.config/fish/functions/fisher.fish"
if ! [ -f $fihser_path ]; then
    curl https://git.io/fisher --create-dirs -sLo $fihser_path

    fish -c fisher

    exec fish # reload with fisher

    fisher add jorgebucaran/fish-bax # exec posix script
    fisher add oh-my-fish/plugin-brew
    fisher add oh-my-fish/plugin-bang-bang
    fisher add oh-my-fish/plugin-fasd
    fisher add oh-my-fish/plugin-extract
    fisher add oh-my-fish/plugin-osx
fi
