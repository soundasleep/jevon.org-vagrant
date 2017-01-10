#!/bin/bash

# Now let's get chef to do it's magic for the first time
echo ">> Running chef-solo..."
cd /home/vagrant/chef

execute_chef () {
  # Each chef-solo run deletes unused cookbooks, so we bring them back each time
  # (The alternative may be to put all of the .jsons into a big runlist)
  # (Or to run --legacy-mode)
  ./clear-cache.sh
  berks vendor cookbooks

  if [ -f "../private/$1" ]; then
    echo ">> --> $1 (private)"
    chef-solo -c solo.rb -j "../private/$1"
  else
    echo ">> --> $1 (public)"
    chef-solo -c solo.rb -j "$1"
  fi
}

execute_chef "hardening.json"
execute_chef "openiaml.org.json"
execute_chef "index.jevon.org.json"
