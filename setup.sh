#!/bin/bash

./homebrew/homebrew.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./dotfiles/dotfiles.sh
