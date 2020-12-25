#!/bin/bash
wget https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb
sudo dpkg -i vagrant_2.2.14_x86_64.deb
rm -f vagrant_2.2.14_x86_64.deb
if [[ "$(< /proc/sys/kernel/osrelease)" == *Microsoft ]]; then 
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1" 
    echo "export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"" >> ~/.bashrc && source ~/.bashrc
fi
