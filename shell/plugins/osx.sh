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

function finderlink {
    if [ -z "$1" ]; then
        echo "First argument should be path of file to link to"
    else
        osascript -e 'tell application "Finder" to make alias file to POSIX file "'$1'" at POSIX file "'$PWD'"'
    fi
}

function screensaver {
    open -a ScreenSaverEngine
}

function showhidden {
    if [ "$1" != "YES" ] && [ "$1" != "NO" ]; then
        echo "First argument needs to be either YES or NO"
    else
        defaults write com.apple.finder AppleShowAllFiles $1
        killall Finder /System/Library/CoreServices/Finder.app
    fi    
}
