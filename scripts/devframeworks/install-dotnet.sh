#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

#ubuntu
if [[ ! -e /etc/apt/sources.list.d/packages-microsoft-prod.list && $distribution = "ubuntu" ]]; then
				# add third-party repo
				mkdir $HOME/tmp -p
				wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O $HOME/tmp/packages-microsoft-prod.deb
        sudo dpkg -i $HOME/tmp/packages-microsoft-prod.deb
        rm $HOME/tmp/packages-microsoft-prod.deb
fi

if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
        sudo apt-get update -qq; \
          sudo apt-get install -y apt-transport-https && \
          sudo apt-get update -qq && \
          sudo apt-get install -y dotnet-sdk-7.0
				exit 0
fi

#rhel
if [[ $distribution == "rhel" ]]; then
				# install app using dnf: sudo dnf install -y app-name
				sudo dnf install -y dotnet-sdk-7.0
				exit 0
fi

#fedora
sudo dnf install -y dotnet-sdk-6.0
