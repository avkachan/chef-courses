# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "chefcl" do |chefcl|
	chefcl.vm.box = "sbeliakou/centos-6.7-x86_64"
	chefcl.vm.hostname = "VM1"
	chefcl.vm.network "private_network", ip: "192.168.25.100"
	chefcl.vm.network "forwarded_port", guest: 81, host: 8181

	chefcl.vm.provider "virtualbox" do |machine|	
		machine.cpus = 1
		machine.memory = 2048
		machine.name = "chefcl"
		end
	chefcl.vm.provision "shell", path: "chefcl.sh"
	end


	#config.vm.define "chefsv" do |vm2|
        #chefsv.vm.box = "sbeliakou/centos-6.7-x86_64"
        #chefsv.vm.hostname = "VM2"
        #chefsv.vm.network "private_network", ip: "192.168.25.101"
	#chefsv.vm.network "forwarded_port", guest: 82, host: 8282

        #chefsv.vm.provider "virtualbox" do |machine|
	#	machine.customize ["modifyvm", :id, "--cpuexecutioncap", "35"]
        #        machine.memory = 1024
        #        machine.name = "chefsv"
        #        end
	#chefsv.vm.provision "shell", path: "chefsv.sh"
        #end

	#config.vm.synced_folder "sources/", "/home/sources",
        #owner:"vagrant", group:"vagrant",
        #create:true

	config.vm.provision "shell", inline: "sudo yum install -y lynx nano"
end
