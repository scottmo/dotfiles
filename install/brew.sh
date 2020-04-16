#!/usr/bin/env sh

# Check for Homebrew and install it if missing
if ! [ $(command -v brew) ]; then
    echo "  Installing Homebrew..."

    # Install the correct homebrew for each OS type
    if [ "$(uname)" = "Darwin" ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi
fi
# Make sure we’re using the latest Homebrew
brew update
