#!/bin/bash
eval "$(sed -n 's/^ID=/distribution=/p' /etc/os-release)"
if [[ ! $distribution = "ubuntu" && ! $distribution = "rhel" && ! $distribution = "fedora" ]]; then
  echo "invalid distribution"
  exit 1
fi

if [[ ! -e /etc/apt/sources.list.d/repo-name.list && $distribution = "ubuntu" ]]; then
				# add third-party repo
fi

if [[ $distribution == "ubuntu" ]]; then
				# install app using apt: sudo apt install -y app-name
				exit 0
fi

# rhel and fedora

# add pre-install steps

# add third-party repo
if [[ ! -e /etc/yum.repos.d/repo-name.repo && $distribution = "rhel"  ]]; then
				# add third-party repo to rhel
fi

if [[ $distribution == "rhel" ]]; then
				# install app using dnf: sudo dnf install -y app-name
				exit 0
fi

# add third-party repo
if [[ ! -e /etc/yum.repos.d/repo-name.repo && $distribution = "fedora" ]]; then
				# add third-party repo to fedora
fi

if [[ $distribution == "fedora" ]]; then
				# install app using dnf: sudo dnf install -y app-name
				exit 0
fi

# common post-install steps if there are any
