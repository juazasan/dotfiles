#!/bin/bash
mkdir $HOME/tmp -p 
curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o $HOME/tmp/kubectl
sudo chmod +x $HOME/tmp/kubectl
sudo mv --force $HOME/tmp/kubectl /usr/local/bin
rm -rf $HOME/tmp/kubectl

# If kubectl is installed, install completion
if type kubectl > /dev/null 2>&1; then
		# kubectl bash completion
		sudo kubectl completion bash > /etc/bash_completion.d/kubectl

		# kubectl zsh completion
		if [ -e "${USERHOME}}/.oh-my-zsh" ]; then
				mkdir -p "${USERHOME}/.oh-my-zsh/completions"
				kubectl completion zsh > "${USERHOME}/.oh-my-zsh/completions/_kubectl"
				chown -R "${USERNAME}" "${USERHOME}/.oh-my-zsh"
		fi
fi

