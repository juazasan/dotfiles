#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

#ubuntu
if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
        sudo apt-get update
        sudo apt-get install software-properties-common -y
        sudo apt-add-repository ppa:ansible/ansible
        sudo apt-get update
        sudo apt-get install ansible -y
				exit 0
fi

# rhel and fedora

sudo dnf install -y ansible-core

