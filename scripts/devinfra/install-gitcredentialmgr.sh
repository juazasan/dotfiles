#!/bin/bash
echo ''
echo 'Installing the git credential manager'
version=2.0.886
mkdir $HOME/tmp -p
curl -sL https://github.com/GitCredentialManager/git-credential-manager/releases/download/v$version/gcm-linux_amd64.$version.tar.gz -o $HOME/tmp/git-credential-manager.tar.gz
sudo tar -xvf $HOME/tmp/git-credential-manager.tar.gz -C /usr/local/bin
git-credential-manager configure
git config --global credential.credentialStore cache
#git config --global credential.canFallBackToInsecureStore true
rm $HOME/tmp/git-credential-manager.tar.gz 
