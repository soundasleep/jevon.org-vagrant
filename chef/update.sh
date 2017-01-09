#!/bin/bash

# Update a specific cookbook to the latest version, rebuild all cookbooks,
# and deal with berks finding caching hard

# VirtualBox shared folder caching arrrgh
sudo ./clear-cache.sh

berks update $1 && berks vendor cookbooks/
