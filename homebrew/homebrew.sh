#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install homebrew apps.
# This uses the "Brewfile" to install all applications listed in there.
# In order to generate or update the brewfile, run:
# brew bundle dump
brew bundle --file=~/setup/homebrew/Brewfile
