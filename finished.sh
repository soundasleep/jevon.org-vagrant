#!/bin/bash

echo "Provisioning complete!"

echo "The current date is $(date) and I'm running on $(hostname) and I am logged in as $USER and home is $HOME"
echo "I am running ruby $(ruby -v) and RVM $(rvm --version)"
echo "rvm is at $(which rvm) and chef-solo is at $(which chef-solo)"
