#!/bin/bash

echo ">> Updating apt-get..."
apt-get update
# TODO configure apt-listchanges to send email updates
apt-get install -y unattended-upgrades apt-listchanges

# Install RVM as per https://rvm.io/rvm/install
# (unless it already exists)
echo ">> Installing RVM..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
[ -x "/usr/local/rvm/bin/rvm" ] || curl -sSL https://get.rvm.io | bash -s stable --ruby
