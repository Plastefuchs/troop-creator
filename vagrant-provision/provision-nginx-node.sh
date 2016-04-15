#!/bin/bash

# ensure we have all the required packages to install
echo "==> Checking  Dependencies"
apt-get update
apt-get -y install git libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev g++ > /dev/null
apt-get -y upgrade > /dev/null


# create node application links
ln -sf /opt/node/$NODE_VERSION/bin/node /usr/bin/node
ln -sf /opt/node/$NODE_VERSION/bin/npm /usr/bin/npm


echo "==> Done.";
