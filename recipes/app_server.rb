#
# Cookbook Name:: ruby-webserver
# Recipe:: app_server
#
include_recipe "apt::default"
include_recipe "build-essential"

#set hostname
if defined? node[:app][:hostname_production]
  if node.chef_environment == 'production'
    node.default['set_fqdn'] = node[:app][:hostname_production]
  elsif node.chef_environment == 'staging'
    node.default['set_fqdn'] = node[:app][:hostname_staging]
  end
  include_recipe "hostname::default"
end

#configure and install ruby
include_recipe "ruby-webserver::rbenv"

#configure and install webservers
include_recipe "ruby-webserver::nginx-unicorn"

#install postgresql client
include_recipe "postgresql::client"
include_recipe "postgresql::ruby"

#install redis;; maybe move this to utlity instance on production
#include_recipe "redis::service"

#create deployment directories
directories = %w( / /shared /shared/config /shared/log /shared/pids /shared/system /shared/assets )
directories.each do |dir|
  directory "#{node[:app][:root_dir]}#{dir}" do
    owner node[:app][:user]
    group node[:app][:group]
    mode "0755"
    action :create
    recursive true #create parent directories if needed but was creating them with wrong owner
  end
end

