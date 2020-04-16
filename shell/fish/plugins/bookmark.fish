#!/usr/bin/env sh

if test -z $BFILE
    set -gx BFILE "$HOME/.bookmarks"
    if test ! -f $BFILE
        touch $BFILE
    end
end
. $BFILE

function bm
    set -l name $argv[1]
    set -l path $argv[2]
    if test -z $path
        set -l path (pwd)
    end
    alias j$name="cd $path"
    echo -e "alias j$name='cd $path'" >> $BFILE
end

function bma
    for folder in */
        set -l name (basename $folder)
        set -l path (pwd)/$name

        set -l name (echo $name | tr '[:upper:]' '[:lower:]' | tr -cd '[a-zA-Z0-9]')
        bm $name $path
    end
end

function bml
    cat $BFILE
end

function bme
    $EDITOR $BFILE
end
