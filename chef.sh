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
chef-solo -c solo.rb -j web.json
