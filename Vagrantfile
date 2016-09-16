# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "chefcl1" do |chefcl1|
	chefcl1.vm.box = "sbeliakou/centos-6.7-x86_64"
	chefcl1.vm.hostname = "chefcl1"
	chefcl1.vm.network "private_network", ip: "192.168.25.100"
	chefcl1.vm.network "forwarded_port", guest: 80, host: 6000
	chefcl1.vm.network "forwarded_port", guest: 443, host: 6443
	

	chefcl1.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 512
		machine.name = "chefcl1"
		end
	chefcl1.vm.provision "shell", path: "chefcl1.sh"
	end

	config.vm.define "chefcl2" do |chefcl2|
	chefcl2.vm.box = "sbeliakou/centos-6.7-x86_64"
	chefcl2.vm.hostname = "chefcl2"
	chefcl2.vm.network "private_network", ip: "192.168.25.102"
	chefcl2.vm.network "forwarded_port", guest: 80, host: 7000
	chefcl2.vm.network "forwarded_port", guest: 443, host: 7443
	

	chefcl2.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 512
		machine.name = "chefcl2"
		end
	chefcl2.vm.provision "shell", path: "chefcl2.sh"
	end

	config.vm.define "chefsv" do |chefsv|
        chefsv.vm.box = "ubuntu/trusty64"
        chefsv.vm.hostname = "chefsv"
        chefsv.vm.network "private_network", ip: "192.168.25.101"
	chefsv.vm.network "forwarded_port", guest: 80, host: 9000
	chefsv.vm.network "forwarded_port", guest: 443, host: 9443

        chefsv.vm.provider "virtualbox" do |machine|
		machine.cpus = 1		
		machine.memory = 4096
                machine.name = "chefsv"
                end
	chefsv.vm.provision "shell", path: "chefsv.sh"
        end
end
