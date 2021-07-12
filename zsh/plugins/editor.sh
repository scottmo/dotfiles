#!/usr/bin/env sh

# mac vim
if [ -d "/Applications/MacVim.app/Contents/bin" ]; then
    export PATH="/Applications/MacVim.app/Contents/bin:$PATH"
fi

# sublime
if [ -d "/Applications/Sublime Text.app/Contents/SharedSupport/bin" ]; then
    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
fi
