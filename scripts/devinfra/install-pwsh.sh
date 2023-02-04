#!/bin/bash
if [[ ! $distribution = "ubuntu" ]]; then
  echo "invalid distribution"
  exit 1
fi
wget -q https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm -f packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y powershell
sudo apt-get install -y powershell-preview
