git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
mkdir $HOME/.bash_completion
ln -sf ~/.kubectx/completion/kubens.bash $HOME/.bash_completion/kubens
ln -sf ~/.kubectx/completion/kubectx.bash $HOME/.bash_completion/kubectx
cat << FOE >> ~/.bashrc


#kubectx and kubens
export PATH=~/.kubectx:\$PATH
FOE
