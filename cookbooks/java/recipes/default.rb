#
# Cookbook Name:: java
# Recipe:: default

#install java 1.7.0 from yml
package 'java-1.7.0-openjdk-devel' do
  action :install
end

#install unzip from yml
package 'unzip' do
  package_name 'unzip'
  action :install
end
