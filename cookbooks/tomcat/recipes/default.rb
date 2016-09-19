# Cookbook Name:: tomcat
# Recipe:: default

#install tomcat from yml
package 'tomcat' do
  action :install
end

#install tomcat from yml
package 'tomcat-webapps' do
  action :install
end

#change port on tomcat
template "/etc/tomcat/server.xml" do
  source "tomcat_server.erb"
  mode "0644"
  owner "tomcat"
  group "tomcat"
  variables({
    'tomcat_port' => node['web_ports']['tomcat_port']
})
end

#add service to tomcat and start it
service "tomcat" do
  supports :restart => true, :start => true, :stop => true, :status => false
  action [ :enable, :start ]
end
