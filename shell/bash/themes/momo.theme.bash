source $DOTFILES/shell/colors.sh

__parse_git_dirty() {
    [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}

__parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(__parse_git_dirty)/"
}

__sadface() {
    [ $? != 0 ] && echo -e "${TXTRED}\xE2\x98\xB9"
}

__prompt_command() {
    __sadface
    PS1="\n\[${BLDYLW}\]<[ \[${BLDGRN}\]\w\[${BLDYLW}\] ]> \[${BLDPUR}\]\$(__parse_git_branch)\[${BLDBLU}\]\n\$ \[${TXTRESET}\]"
}

PROMPT_COMMAND=__prompt_command

