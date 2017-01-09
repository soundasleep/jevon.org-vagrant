# TODO a useful comment
# But this should at least install apache2

include_recipe "apache2"

# # `subversion` task does not create the folder if it doesn't exist;
# # fails with "Could not parse `svn info` data:". #SMRT
# # See https://github.com/chef/chef/issues/4050
# directory node['index.jevon.org']['path'] do
#   owner "root"
#   group "root"
#   mode "0755"
#   action :create
#   recursive true
# end

git "index.jevon.org" do
  repository node['index.jevon.org']['git']
  revision "HEAD"
  destination node['index.jevon.org']['path']
  action :sync
end

web_app "index.jevon.org" do
  docroot node['index.jevon.org']['path']
  server_name node['index.jevon.org']['server_name']
  enable true             # this is the default though
end

service "apache" do
  action :reload
end
