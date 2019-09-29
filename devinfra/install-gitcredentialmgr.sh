#!/bin/bash
mkdir $HOME/git-credential-manager
curl -sL https://github.com/microsoft/Git-Credential-Manager-for-Mac-and-Linux/releases/download/git-credential-manager-2.0.4/git-credential-manager-2.0.4.jar -o $HOME/git-credential-manager/git-credential-manager.jar
java -jar  $HOME/git-credential-manager/git-credential-manager.jar install
git config --global credential.canFallBackToInsecureStore true