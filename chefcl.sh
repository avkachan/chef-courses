#!/bin/bash
cp -f /vagrant/hosts /etc/
yum install -y dejavu-sans-fonts

#rpm -i /vagrant/chef/chefcl.rpm 
#rpm -i /vagrant/chef/chefdk.rpm 
#cp /vagrant/jboss-as-distribution-6.1.0.Final.zip /opt/
#cp -rf /vagrant/.chef/ /root/
#mkdir /root/chef_cookbooks
#cp -rf /vagrant/cookbooks/* /root/chef_cookbooks/
#chef-solo -c /root/.chef/solo.rb |tee /vagrant/chef.log

