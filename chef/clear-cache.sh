#!/bin/bash

# Shared folders + VirtualBox + OS X makes for some very weird
# (and hard to debug) errors.
#
# A symptom of this is running `berks vendor ...`, and it says
# that it is copying files from an updated location, BUT the
# copied files are old and/or incomplete and/or full of NULs.
#
# This command tells the server to clear all of the Linux caches.
# Hashtag devops, yo.
#
# Issue confirmed: https://www.virtualbox.org/ticket/9069
# Solution: http://stackoverflow.com/questions/9479117/vagrant-virtualbox-apache2-strange-cache-behaviour
sync
echo 1 > /proc/sys/vm/drop_caches && echo "Cleared VM cache"
