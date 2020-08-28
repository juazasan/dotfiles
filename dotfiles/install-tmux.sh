#!/bin/bash
sudo apt update

# Setting up tmux
which tmux > /dev/null 2>&1
if [[ $? -eq 0 ]] ; then
echo ''
echo "tmux already installed..."
else
echo "tmux not found, now installing tmux..."
echo ''
sudo apt-get install tmux -y
fi
