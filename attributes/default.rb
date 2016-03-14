#overwrite these in your site specific cookbook

#versions
default[:app][:ruby_version] = '2.1.2'
default['postgresql']['version'] = "9.3"

#specific ruby attributes
default[:rbenv][:group_users] = [ 'ubuntu', 'root' ]

#pp specific attribute
default[:app][:app_name] = 'my_app'
default[:app][:root_dir] = "/var/www/#{node[:app][:app_name]}"
default[:app][:user] = 'ubuntu'
default[:app][:group] = 'ubuntu'
#default[:app][:hostname_production] = ""
#default[:app][:hostname_staging] = "staging.#{node[:app][:hostname_production}"

#specific nginx settings
default[:nginx][:worker_connections] = 1024
default[:unicorn][:socket] = "/tmp/unicorn.#{node[:app][:app_name]}.sock"
default[:unicorn][:worker_processes] = 2

#database related settings
default[:db][:username] = "#{node[:app][:app_name]}_user"
default[:db][:user_password] = "" #password for the apps database user
default[:db][:database_name] = "#{node[:app][:app_name]}_#{node.chef_environment}"
default['postgresql']['password']['postgres'] = "" #password for the postgres user
default['postgresql']['client']['packages'] = [ 'libpq-dev' ]
#echo -n 'somepassword''postgres' | openssl md5 | sed -e 's/.* /md5/'
