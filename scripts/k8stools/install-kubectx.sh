#!/bin/bash
git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
sudo mv ~/.kubectx/kubectx /usr/local/bin
sudo chmod +x /usr/local/bin/kubectx
sudo mv ~/.kubectx/kubens /usr/local/bin
sudo chmod +x /usr/local/bin/kubens

# kubectl bash completion
sudo ln -s ~/.kubectx/completion/kubens.bash /etc/bash_completion.d/kubens
sudo ln -s ~/.kubectx/completion/kubectx.bash /etc/bash_completion.d/kubectx

# kubectl zsh completion
if [ -e "${USERHOME}}/.oh-my-zsh" ]; then
		mkdir -p "${USERHOME}/.oh-my-zsh/completions"
		ln -s ~/.kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh
		ln -s ~/.kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
		chown -R "${USERNAME}" "${USERHOME}/.oh-my-zsh"
fi



