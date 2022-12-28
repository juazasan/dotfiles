#!/bin/bash

./bootstrap-zsh.sh

# powerlevel10k install
echo ''
echo "Now installing powerlevel10k..."
echo ''
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# Setting up zsh defaults

cp ./zshrc.powerlevel10k $HOME/.zshrc
cp ./.p10k.zsh $HOME
