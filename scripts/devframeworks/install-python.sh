#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

#ubuntu
if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
				sudo apt install python3-pip -y
				sudo apt install software-properties-common -y
				sudo add-apt-repository ppa:deadsnakes/ppa -y
				sudo apt-get update
				sudo apt install python3.11 -y
				sudo apt install python3.11-distutils -y
				sudo apt install python3.11-venv -y
				exit 0
fi

#fedora and redhat
sudo dnf install -y python3
sudo dnf install -y python3-pip

