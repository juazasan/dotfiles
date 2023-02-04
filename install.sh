#!/bin/bash
if ! [[ $1 = "install-dotfiles" || $1 = "install-all" || $1 = "install-core" || $1 = "install-core-azure" ]]; then
			 echo "invalid install option"
			 exit 1
fi

eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi
if [[ $distribution = "ubuntu" ]]; then
    sudo apt install make -y
fi
if [[ $distribution = "rhel" || $distribution = "fedora" ]]; then
    sudo dnf install -y make
fi

sudo rm -rf profile/.vim/bundles
make $1
