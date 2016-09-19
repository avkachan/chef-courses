#
# Cookbook Name:: nginx
# Recipe:: default

#install nginx from yml
package 'nginx' do
  action :install
end

#configure nginx
template "/etc/nginx/conf.d/virtual.conf" do
  source "virtual.erb"
  mode "0644"
  owner "root"
  group "root"
  variables({
    'nginx_port' => node['web_ports']['nginx_port'],
    'jenkins_port' => node['web_ports']['jenkins_port'],
    'tomcat_port' => node['web_ports']['tomcat_port']
})
end

#add service to nginx and start it
service "nginx" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
end

