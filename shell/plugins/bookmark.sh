#!/usr/bin/env sh

if [ -z "$BFILE" ]; then
    export BFILE="$HOME/.bookmarks"
    if ! [ -f "$BFILE" ]; then
        touch $BFILE
    fi
fi
source $BFILE

bm() {
    name=$1
    path=$2
    if [ -z "$path" ]; then
        path=$(pwd)
    fi
    alias j$name="cd $path"
    echo -e "alias j$name='cd $path'" >> $BFILE
}

bma() {
    for folder in */; do
        name=$(basename $folder)
        path=$(pwd)/$name

        name=$(echo $name | tr '[:upper:]' '[:lower:]' | tr -cd '[a-zA-Z0-9]')
        bm $name $path
    done
}

bml() {
    cat $BFILE
}

bme() {
    $EDITOR $BFILE
}
