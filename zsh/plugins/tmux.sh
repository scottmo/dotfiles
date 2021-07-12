#!/usr/bin/env sh

! [ $(command -v tmux) ] && return 0

alias tma='tmux attach -t'
alias tmd='tmux detach-client'
alias tms='tmux switch -t'
alias tmls='tmux ls'
alias tmsp='tmux split-window -v'
alias tmvsp='tmux split-window -h'
alias tmnews='tmux new-session -A -s'
alias tmneww='tmux new-window'
alias tmkill='tmux kill-session -t'
alias tmrenames='tmux rename-session'
alias tmrenamew='tmux rename-window'
