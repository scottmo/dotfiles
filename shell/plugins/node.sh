#!/bin/env bash

if [ -d "$HOME/n" ]; then
    export N_PREFIX="$HOME/n";
    [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"
fi
