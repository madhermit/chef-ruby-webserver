#
# Cookbook Name:: ruby-webserver
# Recipe:: nginx-unicorn
#

#make sure rbenv is installed
include_recipe "ruby-webserver::rbenv"

include_recipe "nginx"


#copy over the site specific config
template "#{node[:nginx][:dir]}/sites-available/#{node[:app][:app_name]}" do
  source "nginx/site.conf.erb"
  owner "root"
  group "root"
  mode 00644
  notifies :reload, 'service[nginx]'
end

#enable the site
nginx_site "#{node[:app][:app_name]}" do
  enable true
end

#install unicorn
rbenv_gem "unicorn" do
  rbenv_version node[:app][:ruby_version]
end

#copy over the unicorn init daemon
template "/etc/init.d/#{node[:app][:app_name]}" do
  source "unicorn/init.erb"
  mode 0755
end
