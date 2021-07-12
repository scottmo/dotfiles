#!/usr/bin/env zsh

#
# load plugin manager
#
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source $HOME/.zinit/bin/zinit.zsh
# if already compinit, load completion manually
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#
# plugins
#
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# zinit load zdharma/history-search-multi-word

zinit light Aloxaf/fzf-tab

zinit light trystan2k/zsh-tab-title
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
