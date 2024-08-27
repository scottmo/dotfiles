#!/usr/bin/env sh

[ ! `uname` = "Darwin" ] && return

function cdf {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

function sms {
    osascript -e 'tell application "Messages" to send "'$2'" to participant "'$1'" of (1st account whose service type = SMS)'
}

function trash() {
    if [[ $# ]]; then
        a=()
        for f in "$@"; do
            a+=("$(realpath "$f")")
        done
        f=$(printf "\",POSIX file \"%s" "${a[@]}")\"
        osascript -ss -e"tell app \"Finder\" to delete {${f:2}}" 1>/dev/null
    fi
}

alias displaysleep="pmset displaysleepnow"
alias thermlog="pmset -g thermlog"
