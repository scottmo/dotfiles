#!/usr/bin/env sh
# vim: fdm=marker foldmarker={{{,}}} foldlevel=1

# Exports {{{
    export DOTFILES=$HOME/dotfiles
# }}}
# Plugins {{{
    # CLI Tools {{{
        # nvim {{{
            if hash nvim 2>/dev/null; then
                alias vim='nvim'
            fi
        # }}}
        # fzf {{{
            if hash fzf 2>/dev/null; then
                if [ "$SHELL" = `which zsh` ]; then
                    . ~/.fzf.zsh 
                elif [ "$SHELL" = `which bash` ]; then
                    . ~/.fzf.bash
                fi

                if hash fd 2>/dev/null; then
                    export FZF_DEFAULT_COMMAND='fd -L --type f'
                    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
                    export FZF_ALT_C_COMMAND='fd -L --type d .'
                fi
            fi
        # }}}
        # asdf {{{
            if [ -d "$HOME/.asdf/" ]; then
                . ~/.asdf/asdf.sh
                . ~/.asdf/completions/asdf.bash
            fi
        # }}}
        # tmux {{{
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
        # }}}
        # media {{{
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
        # }}}
    # }}}
    # Directory {{{
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'

        export LSCOLORS='Gxfxcxdxdxegedabagacad'
        alias ls='ls -hF'
        alias l='ls -1'
        alias ll='ls -l'
        alias la='ls -la'
        alias lsdir='echo `ls -l | grep "^d" | awk "{ print $9 }" | tr -d "/"`'

        function cmkdir {
            mkdir -p "$1";cd "$1";
        }
    # }}}
    # Git {{{
        alias gcm='git commit --message'
        alias gamend='git commit --amend --reuse-message HEAD'
        alias gcpn='git cherry-pick --no-commit'
        alias gcpx='git cherry-pick -x'
        alias gcp='git cherry-pick'
        alias gcr='git revert'
        alias greverttobase='git reset HEAD^'
        alias grevertlastcommit='git revert HEAD~'

        alias gst='git status'

        alias ggls='git ls-files'

        alias gms='git merge --squash'

        gsync () {
            branch="$1"
            if [ -z "$branch" ]; then
                branch="$(thisb)"
            fi
            git pull upstream "$branch" && git push origin "$branch"
        }

        # branch
        alias gb='git branch | cat'
        alias gbc='git checkout -b'
        alias gbx='git branch -d'
        alias gbX='git branch -D'
        alias gbm='git branch -m'
        alias gbM='git branch -M'
        alias gco='git checkout'

        alias thisb="git rev-parse --abbrev-ref HEAD"

        gsetupstream() {
            git branch --set-upstream-to=origin/$1 $1
        }

        # util
        alias gshrink='git gc --prune=now --aggressive'
    # }}}
    # Utils {{{
        if ! [ type tree > /dev/null 2>&1 ]; then
            alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
        fi

        alias cpu='top -o cpu'
        alias mem='top -o rsize' # memory

        # determine local IP address
        alias ips='ifconfig | grep "inet " | awk "{ print $2 }"'
        # get external facing ip
        alias ip="curl icanhazip.com"

        function portpsat {
            sudo lsof -i tcp:$1
        }

        # colored man
        function man {
            env \
            LESS_TERMCAP_mb=$(printf "\e[1;31m") \
            LESS_TERMCAP_md=$(printf "\e[1;31m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
        }

        function timeshell {
            time $1 -i -c echo
        }
    # }}}
# }}}
# External local configs {{{
    for file in $DOTFILES/_local_/*.sh; do
        . $file
    done
    unset file
# }}}
