source $DOTFILES/shell/colors.sh

__sadface() {
    [ $? != 0 ] && echo -e "${TXTRED}\xE2\x98\xB9"
}

__prompt_command() {
    __sadface
    dir=$(basename $(dirname $PWD))/$(basename $PWD)
    PS1="\[${BLDBLU}\]- \[${BLDRED}\]$dir >\[${BLDYLW}\]>\[${BLDGRN}\]> \[${TXTRESET}\]"
}

PROMPT_COMMAND=__prompt_command

