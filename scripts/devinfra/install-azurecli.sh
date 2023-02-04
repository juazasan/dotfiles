#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/hashicorp.list && $distribution = "ubuntu" ]]; then
	sudo apt update && sudo apt install gpg -y
	sudo apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg
	curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
	AZ_REPO=$(lsb_release -cs)
	echo "deb [arch=`dpkg --print-architecture`] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
				 	sudo tee /etc/apt/sources.list.d/azure-cli.list
fi
if [[ $distribution == "ubuntu" ]]; then
	sudo apt-get update && sudo apt-get install azure-cli -y
fi

# rhel and fedora
if [[ $distribution = "rhel" || $distribution = "fedora" ]]; then
				if [[ ! -e /etc/yum.repos.d/microsoft-prod.repo && $distribution = "rhel"  ]]; then
								sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
								sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
				fi
				sudo dnf install -y azure-cli
fi

#all-add completion
sudo wget https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion \
				  -O /etc/bash_completion.d/azure-cli



