#!/bin/bash
if [[ ! $distribution = "ubuntu" ]]; then
  echo "invalid distribution"
  exit 1
fi
curl https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/Release.key | sudo apt-key add -
sudo add-apt-repository 'deb https://download.opensuse.org/repositories/isv:/Rancher:/stable/deb/ ./' -y
sudo apt update
sudo apt install rancher-desktop -y
