#!/bin/bash

./homebrew/homebrew.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink dotfiles
ln -sf ~/setup/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/setup/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/setup/dotfiles/.vimrc ~/.vimrc
ln -sf ~/setup/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -sf ~/setup/dotfiles/.zshrc ~/.zshrc

# Symlink nvim
ln -sf ~/setup/nvim ~/.config/nvim
