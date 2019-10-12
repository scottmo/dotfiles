#!/usr/bin/env sh

if hash fzf 2>/dev/null; then
    if [ "$SHELL" = `which zsh` ]; then
        . ~/.fzf.zsh 
    elif [ "$SHELL" = `which bash` ]; then
        . ~/.fzf.bash
    fi

    if hash fd 2>/dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd -L --type d .'
    fi
fi

if hash asdf 2>/dev/null; then
    . ~/.asdf/asdf.sh
    . ~/.asdf/completions/asdf.bash
fi

if hash tmux 2>/dev/null; then
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
fi

if hash ffmpeg 2>/dev/null; then
    function stripAudio {
        ffmpeg -i $1 -an -vcodec copy $2
    }
fi

if hash mkvmerge 2>/dev/null; then
    function mergemkvass {
        for f in *.mkv; do mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"; done
    }
fi

if hash youtube-dl 2>/dev/null; then
    function youtubeMp3 {
        youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 "https://www.youtube.com/watch\?v\=$1"
    }
fi
