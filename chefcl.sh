#!/bin/bash
rpm -i /vagrant/chef/chefcl.rpm 
rpm -i /vagrant/chef/chefdk.rpm 
cp /vagrant/chef/jboss-as-distribution-6.1.0.Final.zip /opt/
cp -rf /vagrant/.chef/ /root/
mkdir /root/chef_cookbooks
cp -rf /vagrant/cookbooks/* /root/chef_cookbooks/
chef-solo -c /root/.chef/solo.rb |tee /vagrant/chef.log

