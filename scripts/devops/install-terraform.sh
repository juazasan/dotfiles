#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/hashicorp.list && $distribution = "ubuntu" ]]; then
	sudo apt update && sudo apt install gpg -y
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
	gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
fi
if [[ $distribution == "ubuntu" ]]; then
	sudo apt-get update && sudo apt-get install terraform -y
	terraform -install-autocomplete
	exit 0
fi

if [[ ! -e /etc/yum.repos.d/hashicorp.repo && $distribution = "rhel"  ]]; then
				wget -O- https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo
fi

if [[ ! -e /etc/yum.repos.d/hashicorp.repo && $distribution = "fedora" ]]; then
				wget -O- https://rpm.releases.hashicorp.com/fedora/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo
fi

sudo dnf install -y terraform
terraform -install-autocomplete
