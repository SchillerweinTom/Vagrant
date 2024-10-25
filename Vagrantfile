# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/jammy64"
  WEBNAME = "web.m340"
  DBNAME = "db.m340"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56" 

  #VM web
  config.vm.define WEBNAME do |subconfig|
    subconfig.vm.box = BOX_IMAGE
	subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	subconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10", name: "VirtualBox Host-Only Ethernet Adapter"
	subconfig.vm.provision "shell", path: "provisioning-web.sh"
	subconfig.vm.synced_folder "web", "/var/www/html"

	subconfig.vm.provider "virtualbox" do |vb|
	  vb.name = WEBNAME
	  vb.memory = "1024"
	  vb.cpus = 2
	end
  end

  #VM database
  config.vm.define DBNAME do |subconfig|
    subconfig.vm.box = BOX_IMAGE
	subconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
	subconfig.vm.provision "shell", path: "provisioning-db.sh"
	
	subconfig.vm.provider "virtualbox" do |vb|
	  vb.name = DBNAME
	  vb.memory = "1024"
	  vb.cpus = 2
	end
  end

end