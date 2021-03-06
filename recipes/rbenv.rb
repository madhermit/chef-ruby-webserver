#
# Cookbook Name:: ruby-webserver
# Recipe:: rbenv
#

node.default['rbenv']['rubies'] = [ "#{node[:app][:ruby_version]}" ]

include_recipe "ruby_build"
include_recipe "ruby_rbenv::system"

#rbenv_ruby node[:app][:ruby_version]

rbenv_gem "bundler" do
  rbenv_version node[:app][:ruby_version]
end
