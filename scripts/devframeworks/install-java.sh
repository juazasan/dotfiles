#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi
echo 'Installing Java...'

#ubuntu
if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
				sudo apt-get update
				sudo apt-get install openjdk-19-jdk -y
				sudo apt-get install openjdk-19-jre -y
				exit 0
fi

#rhel and fedora
sudo dnf install -y java-latest-openjdk

