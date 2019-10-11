#!/usr/bin/env fish

##############################

# if type -q bax
#     bax source ~/dotfiles/shell/base.sh
# end

for file in ~/dotfiles/_local_/*.fish
    source $file
end

. $HOME/.asdf/asdf.fish
. $HOME/.asdf/completions/asdf.fish
