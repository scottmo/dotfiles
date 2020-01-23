#!/usr/bin/env fish

set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
fish -c fisher

exec fish # reload with fisher

fisher add oh-my-fish/theme-bobthefish # theme
fisher add jorgebucaran/fish-bax # exec posix script
fisher add jethrokuan/fzf
fisher add oh-my-fish/plugin-brew
fisher add oh-my-fish/plugin-bang-bang
