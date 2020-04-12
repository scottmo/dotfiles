#!/usr/bin/env bash

# Installs Homebrew and some apps

# Ask for the admin pwd upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
    echo "  Installing Homebrew..."

    # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Install Homebrew packages
apps=(
    zsh
    git
    lua
    python
    python3
    the_silver_searcher
    rename
    imagemagick
)

brew install "${apps[@]}"

# Remove outdated versions
brew cleanup
