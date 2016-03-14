Description
===========

Installs and configures ruby, nginx, unicorn and postgres.

Requirements
============

## Platforms

* Ubuntu

Tested on:

* Ubuntu 14.04

## Cookbooks

cookbook "apt"
cookbook "hostname"
cookbook "git"
cookbook "nginx"
cookbook "postgresql"
cookbook "rbenv", git: 'git://github.com/RiotGames/rbenv-cookbook.git'
cookbook "unicorn"

Attributes
==========

## Configure the following values in your site specific cookbook's default attributes file

* `default[:app][:ruby_version] = '2.1.2'`
* `default['postgresql']['version'] = '9.3'`
* `default[:app][:app_name] = 'my_app'`
* `default[:db][:user_password] = "password"` #password for the apps database user
* `default['postgresql']['password']['postgres'] = ""` #password for the postgres user

