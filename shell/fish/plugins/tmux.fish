#!/usr/bin/env fish

if test (command -v tmux)
    abbr -ag tma 'tmux attach -t'
    abbr -ag tmd 'tmux detach-client'
    abbr -ag tms 'tmux switch -t'
    abbr -ag tmls 'tmux ls'
    abbr -ag tmsp 'tmux split-window -v'
    abbr -ag tmvsp 'tmux split-window -h'
    abbr -ag tmnews 'tmux new-session -A -s'
    abbr -ag tmneww 'tmux new-window'
    abbr -ag tmkill 'tmux kill-session -t'
    abbr -ag tmrenames 'tmux rename-session'
    abbr -ag tmrenamew 'tmux rename-window'
end
