#!/bin/bash
mkdir $HOME/tmp -p
curl -s https://dl.google.com/go/go1.23.0.linux-amd64.tar.gz -o $HOME/tmp/go.tar.gz
tar -C $HOME/tmp -xf $HOME/tmp/go.tar.gz
sudo rm -rf /usr/local/go
sudo mv -f $HOME/tmp/go /usr/local
mkdir $HOME/go -p
mkdir $HOME/go/src -p
mkdir $HOME/go/bin -p
mkdir $HOME/go/pkg -p
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go version
echo 'export GOROOT=/usr/local/go' >> $HOME/.path.config
echo 'export GOPATH=$HOME/go' >> $HOME/.path.config
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> $HOME/.path.config
rm -f $HOME/tmp/go.tar.gz
