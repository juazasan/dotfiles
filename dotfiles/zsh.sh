#!/bin/bash
sudo apt update

# Installing curl
which curl > /dev/null 2>&1
if [[ $? -eq 0 ]] ; then
echo ''
echo "curl already installed..."
else
echo "curl not found, now installing curl..."
echo ''
sudo apt install curl -y
fi

# Installing git completion
echo ''
echo "Enabling git updates and bash-completion..."
echo ''
../devinfra/update-git.sh
sudo apt install git bash-completion -y
fi
echo ''
echo "Now configuring git-completion..."
GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo ''
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi
#

# Vim color scheme install
echo ''
echo "Now installing vim wombat color scheme..."
echo ''
git clone https://github.com/sheerun/vim-wombat-scheme.git ~/.vim/colors/wombat 
mv ~/.vim/colors/wombat/colors/* ~/.vim/colors/

# Midnight commander install
which mc > /dev/null 2>&1
if [[ $? -eq 0 ]] ; then
echo ''
echo "Midnight commander already installed..."
else
echo "Midnight commander not found, now installing Midnight commander..."
echo ''
sudo apt-get install mc -y
fi

# zsh install
which zsh > /dev/null 2>&1
if [[ $? -eq 0 ]] ; then
echo ''
echo "zsh already installed..."
else
echo "zsh not found, now installing zsh..."
echo ''
sudo apt install zsh -y
fi

# oh-my-zsh install
if [ -d ~/.oh-my-zsh/ ] ; then
echo ''
echo "oh-my-zsh is already installed..."
read -p "Would you like to update oh-my-zsh now?" -n 1 -r
echo ''
    if [[ $REPLY =~ ^[Yy]$ ]] ; then
    cd ~/.oh-my-zsh && git pull
        if [[ $? -eq 0 ]]
        then
            echo "Update complete..." && cd
        else
            echo "Update not complete..." >&2 cd
        fi
    fi
else
echo "oh-my-zsh not found, now installing oh-my-zsh..."
echo "type exit when the installation is complete to proceed with the rest of the configuration"
echo ''
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# oh-my-zsh plugin install
echo ''
echo "Now installing oh-my-zsh plugins..."
echo ''
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# powerlevel10k install
echo ''
echo "Now installing powerlevel10k..."
echo ''
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# Setting up zsh defaults

cp ./.zshrc $HOME
cp ./.p10k.zsh $HOME

# Setting up tmux
which tmux > /dev/null 2>&1
if [[ $? -eq 0 ]] ; then
echo ''
echo "tmux already installed..."
else
echo "tmux not found, now installing tmux..."
echo ''
sudo apt-get install tmux -y
fi
echo ''
echo "Now configuring tmux..."
cp ./zsh.tmux.conf $HOME/.tmux.conf
echo ''

# changing default shell to tmux
echo ''
echo "changing default shell to tmux"
echo ''
chsh -s /usr/bin/tmux