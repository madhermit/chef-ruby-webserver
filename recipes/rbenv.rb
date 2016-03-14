#
# Cookbook Name:: ruby-webserver
# Recipe:: rbenv
#

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby node[:app][:ruby_version] do
  global true
end

rbenv_gem "bundler" do
  ruby_version node[:app][:ruby_version]
end
