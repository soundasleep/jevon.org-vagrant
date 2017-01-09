#!/bin/bash

# Now let's get chef to do it's magic for the first time
# NOTE! It looks like librarian-chef is abandoned, and the new cool technology
# that all the kids use is called Berkshelf: https://docs.chef.io/berkshelf.html
# And I think it works the same: https://github.com/englishm/chef-solo-pattern/commits/master
echo ">> Installing berkshelf dependencies..."
cd /home/vagrant/chef
berks vendor cookbooks

# Now do the magic
echo ">> Running chef-solo..."
cd /home/vagrant/chef

execute_chef () {
  if [ -f "../private/$1" ]; then
    echo ">> --> $1 (private)"
    chef-solo -c solo.rb -j "../private/$1"
  else
    echo ">> --> $1 (public)"
    chef-solo -c solo.rb -j "$1"
  fi
}

execute_chef "openiaml.org.json"
execute_chef "index.jevon.org.json"
