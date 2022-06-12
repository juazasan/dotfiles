#!/bin/bash
KIND_VERSION=0.14.0
mkdir $HOME/tmp -p
curl -Lo $HOME/tmp/kind https://kind.sigs.k8s.io/dl/v$KIND_VERSION/kind-linux-amd64
chmod +x $HOME/tmp/kind
sudo mv -f $HOME/tmp/kind /usr/local/bin
kind version
