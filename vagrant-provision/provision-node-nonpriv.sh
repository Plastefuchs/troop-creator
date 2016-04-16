#!/bin/bash

# node settings
NODE_VERSION=5.10

cd /home/vagrant

# Installing nvm
echo "==> Installing nvm";

wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh  > /dev/null

# This enables NVM without a logout/login
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Install a node and alias
echo "==> Installing node";
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION

# install global http-server
# echo "==> Installing simplehttpserver into global";
# npm install simplehttpserver -g

# echo "==> Installing project packages";
# cd /vagrant/
# npm install -g


