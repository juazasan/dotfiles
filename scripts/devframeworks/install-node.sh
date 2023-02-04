#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ $distribution = "ubuntu" ]]; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
fi
if [[ $distribution = "rhel" || $distribution = "fedora" ]]; then
    curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo -E bash - &&\
    sudo dnf install -y nodejs
fi
sudo npm install -g npm@latest
sudo npm install -g typescript
npm --version
node --version
