#!/bin/bash
echo ''
echo 'Installing the git credential manager'
curl -sL https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.886/gcm-linux_amd64.2.0.886.deb -o $HOME/tmp/gcmcore-linux_amd64.deb
sudo dpkg -i $HOME/tmp/gcmcore-linux_amd64.deb
git-credential-manager-core configure
rm -f $HOME/tmp/gcmcore-linux_amd64.deb
git config --global credential.credentialStore cache
#git config --global credential.canFallBackToInsecureStore true
