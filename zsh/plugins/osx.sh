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

alias displaysleep="pmset displaysleepnow"
alias thermlog="pmset -g thermlog"
