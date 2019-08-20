#!/usr/bin/env zsh

function installZim() {
    git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

    cp ~/.zim/templates/zimrc ~/.zimrc
    cp ~/.zim/templates/zlogin ~/.zlogin

    zsh -c 'source ${ZDOTDIR:-${HOME}}/.zlogin'
}
installZim
