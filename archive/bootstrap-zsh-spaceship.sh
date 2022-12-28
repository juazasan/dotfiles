#!/bin/bash

# spaceshift install
echo ''
echo "Now installing spaceshift..."
echo ''
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt" --depth=1
rm $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme
ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme 
ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme

# Setting up zsh defaults

cp ./zshrc.spaceship $HOME/.zshrc
