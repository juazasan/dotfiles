#!/bin/bash
mkdir $HOME/tmp 
curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o $HOME/tmp/kubectl
sudo chmod +x $HOME/tmp/kubectl
sudo mv --force $HOME/tmp/kubectl /usr/local/bin
rm -rf $HOME/tmp/kubectl