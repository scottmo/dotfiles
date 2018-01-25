#!/usr/bin/env zsh

setopt NOEXTENDED_HISTORY
setopt NOSHAREHISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# ignore error commands
zshaddhistory() {
    local line=${1%%$'\n'}
    whence ${${(z)1}[1]} >| /dev/null && [[ ${#line} -ge 5 ]]
}
