#!/bin/bash

# Install chef-solo
# (unless it already exists)
echo ">> Installing chef-client..."
[ -x "/usr/bin/chef-client" ] || curl -L https://www.opscode.com/chef/install.sh | bash

# Install berkshelf gem
echo ">> Installing berkshelf...."
gem install berkshelf

# Install knife solo gem to help us set up chef-solo
# https://matschaffer.github.io/knife-solo/
echo ">> Installing berkshelf...."
gem install knife-solo
