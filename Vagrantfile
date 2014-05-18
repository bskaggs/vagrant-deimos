# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/ubuntu-13.10"

  config.vm.network "forwarded_port", guest: 5050, host: 5050
  config.vm.network "forwarded_port", guest: 5051, host: 5051
  #config.vm.hostname "mesos"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end
  config.vm.provision "shell", path: "install_mesos.sh"
end
