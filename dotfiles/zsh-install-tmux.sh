#!/bin/bash
sudo apt update

# Installing tmux

./install-tmux.sh

# Setting up tmux
echo ''
echo "Now configuring tmux..."
cp ./zsh.tmux.conf $HOME/.tmux.conf
echo ''

# changing default shell to tmux
#echo ''
#echo "changing default shell to tmux"
#echo ''
#chsh -s /usr/bin/tmux
