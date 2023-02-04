install-dotfiles:
	./install-dotfiles.sh

install-azure:
	scripts/devinfra/install-azurecli.sh
	scripts/devinfra/install-azcopy.sh

install-dev-tools:
	scripts/devinfra/install-githubcli.sh
	scripts/devinfra/install-docker.sh
	scripts/devinfra/install-virtualbox.sh
	scripts/devinfra/install-vagrant.sh
	scripts/devops/install-terraform.sh

install-k8s-tools:
	scripts/k8stools/install-kubectl.sh
	scripts/k8stools/install-helm.sh
	scripts/k8stools/install-kubectx.sh

install-dotnet:
	scripts/devframeworks/install-dotnet.sh

install-java:
	scripts/devframeworks/install-java.sh

install-python:
	scripts/devframeworks/install-python.sh

install-dev-languages: install-dotnet install-java install-python

install-all: install-dotfiles install-azure install-dev-tools install-k8s-tools install-dev-languages

install-core-azure: install-dotfiles install-azure install-dev-tools install-k8s-tools

install-core: install-dotfiles install-dev-tools install-k8s-tools

test-ubuntu:
	vagrant up ubuntu --provision-with install-all || exit 1
	vagrant destroy ubuntu --force

test-fedora:
	vagrant up fedora --provision-with install-all || exit 1
	vagrant destroy fedora --force

test-rhel:
	vagrant up rhel9 --provision-with register || exit 1
	vagrant halt rhel9
	vagrant up rhel9 --provision-with install-all || exit 1
	vagrant halt rhel9
	vagrant up rhel9 --provision-with unregister || exit 1
	vagrant destroy rhel9 --force
