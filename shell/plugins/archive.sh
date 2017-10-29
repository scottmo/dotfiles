#!/usr/bin/env sh

alias targz='tar czvf' # tar and gzip

extract () {
    if [ $# -ne 1 ]; then
        echo "Error: No file specified."
        return 1
    fi
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via extract" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

tarsplit () {
    if [ $# -ne 3 ]; then
        echo -e "Usage: tarsplit <files> <size> <file_name>\n"
        echo -e "e.g. tarsplit dir/ 1024M splitted_files\n"
        exit 1
    fi
    tar czf $1 | split -b=$2 $3.
}

tarcombine () {
    if [ $1 == '' ]; then
        echo -e "Usage: tarcombine <file_prefix>\n"
        exit 1
    fi
    cat $1.* | tar xzvf -
}