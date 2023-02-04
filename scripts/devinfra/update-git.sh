#!/bin/bash
if [[ ! $distribution = "ubuntu" ]]; then
  echo "invalid distribution"
  exit 1
fi
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
git --version
