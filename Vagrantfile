# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "chefcl" do |chefcl|
	chefcl.vm.box = "sbeliakou/centos-6.7-x86_64"
	chefcl.vm.hostname = "VM1"
	chefcl.vm.network "private_network", ip: "192.168.25.100"
	chefcl.vm.network "forwarded_port", guest: 80, host: 7000
	chefcl.vm.network "forwarded_port", guest: 443, host: 7443
	

	chefcl.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 2048
		machine.name = "chefcl"
		end
	chefcl.vm.provision "shell", path: "chefcl.sh"
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
