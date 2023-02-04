#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"

if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
		 echo "invalid distribution"
		 exit 1
fi	 

#ubuntu
if [[ $distribution = "ubuntu" ]]; then
    sudo apt update -q=2
    sudo apt install -y virtualbox
    exit 0
fi

#redhat and fedora
if [[ $distribution = "rhel" ]]; then
    sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
    sudo dnf update -y
    #sudo dnf install -y binutils kernel-devel kernel-headers libgomp make patch gcc glibc-headers glibc-devel dkms
		sudo wget https://download.virtualbox.org/virtualbox/rpm/$distribution/virtualbox.repo -P /etc/yum.repos.d/
		sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
fi
if [[ $distribution = "fedora" ]]; then
#sudo dnf install -y @development-tools
#sudo dnf install -y kernel-devel kernel-headers dkms qt5-qtx11extras  elfutils-libelf-devel zlib-devel
echo -e "[virtualbox]
name=Fedora \$releasever - \$basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/36/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc" | sudo tee /etc/yum.repos.d/virtualbox.repo
fi # fedora

sudo dnf install -y VirtualBox-7.0

    
