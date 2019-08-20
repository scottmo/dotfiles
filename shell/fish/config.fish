#!/usr/bin/env fish

# gsamokovarov/jump - setup cd tracker
status --is-interactive; and source (jump shell fish | psub)

##############################

if type -q bax
    bax source ~/dotfiles/shell/base.sh
end

. $HOME/.asdf/asdf.fish
. $HOME/.asdf/completions/asdf.fish
