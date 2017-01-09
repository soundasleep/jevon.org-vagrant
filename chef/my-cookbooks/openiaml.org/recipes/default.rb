# TODO a useful comment
# But this should at least install apache2

include_recipe "apache2"

# `subversion` task does not create the folder if it doesn't exist;
# fails with "Could not parse `svn info` data:". #SMRT
# See https://github.com/chef/chef/issues/4050
directory node['openiaml.org']['path'] do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

package "subversion"

subversion "openiaml.org" do
  repository node['openiaml.org']['svn']
  revision "HEAD"
  destination node['openiaml.org']['path']
  svn_username node['openiaml.org']['svn_username'] if node['openiaml.org']['svn_username']
  svn_password node['openiaml.org']['svn_password'] if node['openiaml.org']['svn_password']
  action :sync
end

web_app "openiaml.org" do
  docroot node['openiaml.org']['path']
  server_name node['openiaml.org']['server_name']
  enable true             # this is the default though
end

service "apache" do
  action :reload
end
