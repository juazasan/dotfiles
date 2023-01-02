#!/bin/bash

# Pre-requisites
scripts/devframeworks/install-go.sh
scripts/devframeworks/install-node.sh

# Download bundles
mkdir profile/.vim/bundles -p
pushd profile/.vim/bundles
git clone https://github.com/ctrlpvim/ctrlp.vim.git ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git nerdtree
git clone https://github.com/majutsushi/tagbar.git tagbar
git clone https://github.com/fatih/vim-go.git vim-go
git clone https://github.com/jistr/vim-nerdtree-tabs.git vim-nerdtree-tabs
git clone https://github.com/itchyny/lightline.vim lightline.vim
git clone https://github.com/klen/python-mode.git python-mode
pushd python-mode
git submodule update --init --recursive
popd
git clone https://github.com/leafgarland/typescript-vim.git typescript-vim
git clone https://github.com/tpope/vim-fugitive.git vim-fugitive
git clone https://github.com/Valloric/YouCompleteMe.git YouCompleteMe
pushd YouCompleteMe
git submodule update --init --recursive
source ~/.path.config       
python3 install.py --go-completer --ts-completer
popd

# Vim color scheme install
# echo ''
# echo "Now installing vim wombat color scheme..."
# echo ''
# git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat 
# mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/
rm ~/.vimrc
ln -s $(pwd)/profile/.vimrc ~/.vimrc