#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/repo-name.list && $distribution = "ubuntu" ]]; then
				# add third-party repo
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $HOME/tmp/microsoft.gpg
sudo mv $HOME/tmp/microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
fi

if [[ ! -e /etc/apt/sources.list.d/repo-name.list && $distribution = "ubuntu" ]]; then
				# add third-party repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
fi

if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
sudo apt-get install azure-functions-core-tools -y
				exit 0
fi

# rhel and fedora
sudo dnf install -y unzip
mkdir $HOME/tmp -p 
curl -L https://github.com/Azure/azure-functions-core-tools/releases/download/4.0.4915/Azure.Functions.Cli.linux-x64.4.0.4915.zip -o $HOME/tmp/azure.functions.cli.zip
unzip -d ~/azure-functions-cli $HOME/tmp/azure.functions.cli.zip
pushd ~/azure-functions-cli 
chmod +x ~/azure-functions-cli/func
chmod +x ~/azure-functions-cli/gozip
./func
popd
echo "export PATH=$(pwd):$PATH" >> ~/.path.config
rm $HOME/tmp/azure.functions.cli.zip
