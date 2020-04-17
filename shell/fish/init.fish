#!/usr/bin/env fish

function setenv
    if [ $argv[1] = PATH ]
        # Replace colons and spaces with newlines
        set -gx PATH (echo $argv[2] | tr ': ' \n)
    else
        set -gx $argv
    end
end
function setalias
    abbr -ag $argv
end

source $HOME/dotfiles/shell/env.sh
for file in ~/dotfiles/shell/fish/utils/*.fish
    source $file
end
