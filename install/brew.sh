#!/usr/bin/env bash

# Installs Homebrew and some apps

# Ask for the admin pwd upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes

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
    tree
    rename
    imagemagick
    # macvim --with-lua --with-python3 --with-override-system-vim
)

brew install "${apps[@]}"

# Remove outdated versions
brew cleanup
