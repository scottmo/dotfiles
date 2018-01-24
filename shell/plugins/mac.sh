#!/usr/bin/env sh

[ ! `uname` = 'Darwin' ] && return

alias rcmac="$EDITOR $DOTFILES/shell/plugins/mac.sh"

#
# utils aliases and functions
#
alias ls='ls -GF'

# goto login screen
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# start screensaver
alias screensaver="open -a ScreenSaverEngine"

# airport, wifi utlity
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# cd to current finder folder
cdf () {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# show/hide hidden files
alias showHidden='_hidden_files YES'
alias hideHidden='_hidden_files NO'
_hidden_files () {
    defaults write com.apple.finder AppleShowAllFiles $1
    killall Finder /System/Library/CoreServices/Finder.app
}

pman () {
    man -t "$@" | open -f -a /Applications/Preview.app
}

finderlink () {
    osascript -e 'tell application "Finder" to make alias file to POSIX file "'$1'" at POSIX file "'$PWD'"'
}
