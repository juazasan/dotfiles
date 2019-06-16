#!/bin/bash
mkdir $HOME/tmp
curl -s https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz -o $HOME/tmp/go.tar.gz
tar -C $HOME/tmp -xf $HOME/tmp/go.tar.gz
sudo mv $HOME/tmp/go /usr/local
mkdir $HOME/go
mkdir $HOME/go/src
mkdir $HOME/go/bin
mkdir $HOME/go/pkg
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go version
echo 'export GOROOT=/usr/local/go' >> $HOME/.profile
echo 'export GOPATH=$HOME/go' >> $HOME/.profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> $HOME/.profile
rm -f $HOME/tmp/go.tar.gz