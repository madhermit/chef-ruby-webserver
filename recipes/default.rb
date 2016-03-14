#
# Cookbook Name:: ruby-webserver
# Recipe:: default
#

#this recipe is not used. include both the following cookbooks for staging server and
#them individually on the different production servers

#include_recipe "ruby-webserver::database"
#include_recipe "ruby-webserver::app_server"

#TODO register unicorn startup as a service that runs on boot
#TODO add database to recipe for both staging and production
