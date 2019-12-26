git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
sudo mv ~/.kubectx/kubectx /usr/local/bin
sudo chmod +x /usr/local/bin/kubectx
sudo mv ~/.kubectx/kubens /usr/local/bin
sudo chmod +x /usr/local/bin/kubens
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s ~/.kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s ~/.kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh