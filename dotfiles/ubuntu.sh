#!/bin/bash
# Update pkg list
echo "Updating package lists..."
sudo apt-get update
sudo apt upgrade -y
# Installing git completion
echo ''
echo "Now installing git and bash-completion..."
sudo apt-get install git bash-completion -y

# Vim and color scheme install
echo ''
echo 'Installing vim first...'
sudo apt install vim -y
echo ''
echo "Now installing vim gruvbox color scheme..."
echo ''
wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
mkdir -p ~/.vim/colors
mv gruvbox.vim ~/.vim/colors/
cp .vimrc ~/.vim

# Midnight commander install
echo ''
echo "Now installing Midnight commander..."
echo ''
sudo apt-get install mc -y
echo 'alias mc="mc -x"' >> $HOME/.bashrc

# Setting up tmux
echo ''
echo "Now installing and configuring tmux..."
echo ''
sudo apt-get install tmux -y
cp ./bash.tmux.conf $HOME/.tmux.conf

# install powerline

echo ''
echo 'installing powerline'
echo ''
../devframeworks/install-python.sh
pip install powerline-status
pip install powerline-shell
sudo apt update
sudo apt-get install fonts-powerline -y

# updating bash
echo ''
echo 'updating .bashrc and .bashaliases'
echo ''
cp ./.bash_aliases $HOME
cp ./.bashrc $HOME

# changing default shell to tmux
echo ''
echo "changing default shell to tmux"
echo ''
chsh -s /usr/bin/tmux
