#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/docker.list && $distribution = "ubuntu" ]]; then
  # Download and add Docker's official public PGP key.
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Add the `stable` channel's Docker upstream repository.
  #
  # If you want to live on the edge, you can change "stable" below to "test" or
  # "nightly". I highly recommend sticking with stable!
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Update the apt package list (for the new apt repo).
  sudo apt-get update -q=2
fi

if [[ $distribution == "ubuntu" ]]; then
  # Install Docker's package dependencies.
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

  # Install the latest version of Docker CE.
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
fi

if [[ ! -e /etc/yum.repos.d/docker-ce.repo && $distribution = "rhel"  ]]; then
#  sudo yum install -y yum-utils
#  sudo yum-config-manager \
#      --add-repo \
#      https://download.docker.com/linux/centos/docker-ce.repo				
  sudo dnf -y install dnf-plugins-core
  sudo dnf config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo
fi

if [[ ! -e /etc/yum.repos.d/docker-ce.repo && $distribution = "fedora" ]]; then
  sudo dnf -y install dnf-plugins-core
  sudo dnf config-manager \
      --add-repo \
      https://download.docker.com/linux/fedora/docker-ce.repo
fi

if [[ $distribution = "rhel" || $distribution = "fedora" ]]; then
  sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  sudo systemctl enable docker
	sudo systemctl start docker
fi
# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
#newgrp docker
sudo curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
echo 'export PATH=~/.local/bin:$PATH' >> ~/.path.config && source ~/.path.config
