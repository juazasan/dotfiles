#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

#ubuntu
if [[ ! -e /etc/apt/sources.list.d/trivy.list && $distribution = "ubuntu" ]]; then
				# add third-party repo
        sudo apt-get -y install wget apt-transport-https gnupg lsb-release
        wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
        echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
        sudo apt-get update -qq
fi

if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
        sudo apt-get -y install trivy
				exit 0
fi

# rhel and fedora

if [[ -e /etc/yum.repos.d/trivy.repo ]]; then
				RELEASE_VERSION=$(grep -Po '(?<=VERSION_ID=")[0-9]' /etc/os-release)
				cat << EOF | sudo tee -a /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/$RELEASE_VERSION/\$basearch/
gpgcheck=0
enabled=1
EOF
fi

sudo yum -y install trivy
