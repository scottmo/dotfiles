#!/usr/bin/env sh

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# top
alias cpu='top -o cpu'
alias mem='top -o rsize' # memory

# determine local IP address
ips () {
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# get external facing ip
alias ip="curl icanhazip.com"

portpsat() {
    sudo lsof -i tcp:$1
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

