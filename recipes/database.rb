#
# Cookbook Name:: ruby-webserver
# Recipe:: database
#

#set hostname for database server only if its in production
#if node.chef_environment == "production"
  #node.default['set_fqdn'] = 'db.#{node[:app][:hostname_production}'
  #include_recipe "hostname::default"
#end

#set hostname
if node.chef_environment == 'production'
  node.default['postgresql']['config']['listen_addresses'] = 'localhost' #maybe should be the client ip
elsif node.chef_environment == 'staging'
  node.default['postgresql']['config']['listen_addresses'] = 'localhost'
end

include_recipe "postgresql::server"

# create new postgres user
execute "create new postgres user" do
  user "postgres"
  command "psql -c \"create role #{node[:db][:username]} with createdb login password '#{node[:db][:user_password]}';\""
  not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_roles WHERE rolname='#{node[:db][:username]}'\" | wc -l`.chomp == "1" }
end

# create new postgres database
#execute "create new postgres database" do
  #user "postgres"
  #command "psql -c \"create database #{node[:db][:database_name]} owner #{node[:db][:username]};\""
  #not_if { `sudo -u postgres psql -tAc \"SELECT * FROM pg_database WHERE datname='#{node[:db][:database_name]}'\" | wc -l`.chomp == "1" }
#end

