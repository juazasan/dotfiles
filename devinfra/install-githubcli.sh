#!/bin/bash
echo ''
echo 'Installing the github cli'
VERSION="0.11.1"
mkdir -p $HOME/tmp
curl -sL https://github.com/cli/cli/releases/download/v$VERSION/gh_${VERSION}_linux_amd64.deb -o $HOME/tmp/gh_cli_linux_amd64.deb
sudo apt install $HOME/tmp/gh_cli_linux_amd64.deb
rm $HOME/tmp/gh_cli_linux_amd64.deb
echo 'github cli installed'
gh --version
