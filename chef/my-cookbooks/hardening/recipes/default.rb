#
# Cookbook Name:: hardening
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Managing users based on https://blog.chef.io/2014/07/10/managing-users-and-ssh-keys-in-a-hybrid-world/
users_manage "sysadmin" do
  action [ :remove, :create ]
end
