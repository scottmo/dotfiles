#!/usr/bin/env zsh

#
# load plugin manager
#
source $HOME/.zinit/bin/zinit.zsh
# if already compinit, load completion manually
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#
# plugins
#
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

zinit load zdharma/history-search-multi-word

zinit light Aloxaf/fzf-tab

zinit light trystan2k/zsh-tab-title
ZSH_TAB_TITLE_DEFAULT_DISABLE_PREFIX=true
