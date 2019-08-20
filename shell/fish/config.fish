# auto install fisher and plugins
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher

    fisher add oh-my-fish/theme-bobthefish # theme
    fisher add jorgebucaran/fish-bax # exec posix script
    fisher add jethrokuan/fzf
    fisher add oh-my-fish/plugin-brew
    fisher add oh-my-fish/plugin-bang-bang
end

# gsamokovarov/jump - setup cd tracker
status --is-interactive; and source (jump shell fish | psub)

##############################

if type -q bax
    bax source ~/dotfiles/shell/base.sh
end

. $HOME/.asdf/asdf.fish
. $HOME/.asdf/completions/asdf.fish
