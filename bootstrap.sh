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

### install and configure git
sudo apt-get install -y git
scrips/devinfra/update-git.sh
GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo ''
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi

### configure profile

# set tmux as default shell
# chsh -s $(which tmux)

# Vim color scheme install
echo ''
echo "Now installing vim wombat color scheme..."
echo ''
git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat 
mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/

# link dotfiles
touch ~/.path.config
echo "source $(pwd)/profile/.bashrc" > ~/.bashrc
ln -s $(pwd)/profile/.tmux.conf ~/.tmux.conf
source ~/.bashrc

