#!/usr/bin/env sh

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# determine local IP address
ips () {
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# colored man
man () {
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

# ag find
if hash ag 2>/dev/null; then
    agf() {
        find . -name "$1" -type f -exec ag "$2" {} +
    }
fi
