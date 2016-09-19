# Cookbook Name:: jenkins
# Recipe:: default
include_recipe "java"
include_recipe "nginx"
include_recipe "tomcat"
#install repository for install jenkins
template "/etc/yum.repos.d/jenkins.repo" do
  source "jenkins_repo.erb"
  mode "0644"
  owner "root"
  group "root"
end

#install jenkins from repository
package 'jenkins' do
  action :install
end

#add jenkins port from environment atributes to jenkins config
template "/etc/sysconfig/jenkins" do
  source "jenkins_config.erb"
  mode "0644"
  owner "root"
  group "root"
  variables({
    'jenkins_port' => node['web_ports']['jenkins_port']
    })
end

#copy jobs for jenkins and needed plugins for them
remote_directory "/var/lib/jenkins" do
  source 'jenkins'
  owner 'jenkins'
  group 'jenkins'
  files_owner 'jenkins'
  files_group 'jenkins'
  mode 0755
  action :create
end

#install git from yml
package 'git' do
  action :install
end

#add user jenkins to group tomcat for jenkins can deploy app to tomcat
group 'tomcat' do
  action :modify
  members 'jenkins'
  append true
end

#change owner to jenkins for /var/lib/jenkins
execute 'jenkins home chown' do
  command "chown -R jenkins:jenkins /var/lib/jenkins"
end

#change owner to tomcat for /var/lib/tomcat/webapps/
execute 'tomcat webapps chown' do
  command "chown -R tomcat:tomcat /var/lib/tomcat/webapps/"
end

#start add service to jenkins and start it
service "jenkins" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
  end
