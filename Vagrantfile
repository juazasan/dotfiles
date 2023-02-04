# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "fedora" do |server|
    server.vm.hostname = "fedora37"
    server.vm.box = "generic/fedora37"
  end
  config.vm.define "rhel9" do |server|
    server.vm.hostname = "rhel9"
    server.vm.box = "generic/rhel9"
  end
  config.vm.define "ubuntu" do |server|
    server.vm.hostname = "ubuntu"
    server.vm.box = "generic/ubuntu2204"
  end
  config.vm.synced_folder ".", "/home/vagrant/dotfiles"
  config.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
  end
  config.vm.provision "install-all", type: "shell", run: "never" do |s|
    s.inline = $install
    s.args = ["install-all"]
  end
  config.vm.provision "install-dotfiles", type: "shell", run: "never" do |s|
    s.inline = $install
    s.args = ["install-dotfiles"]
  end
  config.vm.provision "install-core", type: "shell", run: "never" do |s|
    s.inline = $install
    s.args = ["install-core"]
  end
  config.vm.provision "install-core-azure", type: "shell", run: "never" do |s|
    s.inline = $install
    s.args = ["install-core-azure"]
  end
  config.vm.provision "register", type: "shell", run: "never" do |s|
    s.inline = "dotfiles/register-subscription.sh" 
  end
  config.vm.provision "unregister", type: "shell", run: "never" do |s|
    s.inline = $unregister
  end
end

$install = <<SCRIPT
cd dotfiles
./install.sh $1
SCRIPT

$unregister = <<SCRIPT
isRegistered=$(sudo subscription-manager list | grep -i Status | grep -i Subscribed)
if [[ -n "$isRegistered" ]] ; then
    sudo subscription-manager unregister
fi
SCRIPT

