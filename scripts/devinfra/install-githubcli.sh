#!/bin/bash
echo ''
echo 'Installing the github cli'

eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/github-cli.list && $distribution = "ubuntu" ]]; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update -qq
fi

if [[ $distribution == "ubuntu" ]]; then
    sudo apt install -y gh
fi

if [[ $distribution = "rhel" || $distribution = "fedora" ]]; then
    sudo dnf -y install 'dnf-command(config-manager)'
    sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
    sudo dnf -y install gh
fi

echo 'github cli installed'
gh --version

# bash completion
sudo gh completion -s bash > /etc/bash_completion.d/gh

# zsh completion
if [ -e "${USERHOME}}/.oh-my-zsh" ]; then
		mkdir -p "${USERHOME}/.oh-my-zsh/completions"
		gh completion -s zsh > "${USERHOME}/.oh-my-zsh/completions/_gh"
		chown -R "${USERNAME}" "${USERHOME}/.oh-my-zsh"
fi
