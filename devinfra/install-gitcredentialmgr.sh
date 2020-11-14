#!/bin/bash
echo ''
echo 'Installing the git credential manager'
curl -sL https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.252-beta/gcmcore-linux_amd64.2.0.252.766.deb -o $HOME/tmp/gcmcore-linux_amd64.deb
sudo dpkg -i $HOME/tmp/gcmcore-linux_amd64.deb
git-credential-manager-core configure
rm -f $HOME/tmp/gcmcore-linux_amd64.deb
git config --global credential.credentialStore secretservice
#git config --global credential.canFallBackToInsecureStore true
