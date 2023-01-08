#!/bin/bash
sudo apt update
mkdir ~/tmp -p

### install required tools ###
sudo apt-get install -y jq
sudo apt-get install -y htop
sudo apt-get install -y tmux
sudo apt-get install -y sysstat
sudo apt-get install -y curl
sudo apt-get install -y mc
sudo apt-get install -y make
sudo apt-get install -y make-doc
sudo apt-get install -y universal-ctags
sudo apt-get install -y build-essential cmake python3-dev # YouCompleteMe needs these

### install and configure git
sudo apt-get install -y git
scripts/devinfra/update-git.sh
GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo ''
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi
echo "Configuring git settings..."
read -p "Enter your name:" git_name
read -p "Enter your email address:" git_email
git config --global user.name $git_name
git config --global user.email $git_email
if [[ $(grep -i microsoft /proc/version) ]]; then
  git config --global credential.credentialStore cache
  git config --global credential.https://dev.azure.com.useHttpPath true
  git config --global credential.helper "/c/Program\ Files/Git/mingw64/bin/git-credential-manager-core.exe"
else
				scripts/devinfra/install-gitcredentialmgr.sh
fi

### vim...
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
popd
# Vim color scheme install
# echo ''
# echo "Now installing vim wombat color scheme..."
# echo ''
# git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat
# mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/

# link .vimrc
rm ~/.vimrc
ln -s $(pwd)/profile/.vimrc ~/.vimrc

### configure profile
# set tmux as default shell
# chsh -s $(which tmux)

### link dotfiles
touch ~/.path.config
echo "export VIM_PATH=$(pwd)/profile/.vim" >> ~/.path.config
echo "source $(pwd)/profile/.bashrc" > ~/.bashrc
ln -s $(pwd)/profile/.tmux.conf ~/.tmux.conf
source ~/.bashrc

