#!/bin/bash

# nginx settings
NGINX_VERSION=1.9.14
NGINX_SOURCE=http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz

# ensure we have all the required packages to install
echo "==> Checking  Dependencies"
apt-get update
apt-get -y install git libpcre3 libpcre3-dev libpcrecpp0 libssl-dev zlib1g-dev > /dev/null
apt-get -y upgrade > /dev/null


# create node application links
ln -sf /opt/node/$NODE_VERSION/bin/node /usr/bin/node
ln -sf /opt/node/$NODE_VERSION/bin/npm /usr/bin/npm

# if we don't have nginx install, then install
echo "==> Checking Nginx version $NGINX_VERSION installed"
if [ ! -e /opt/nginx-$NGINX_VERSION ]
then
	echo "==> Installing Nginx $NGINX_VERSION";
	echo "Downloading nginx source from $NGINX_SOURCE";

	cd /usr/src
	wget --quiet http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz
	tar xf nginx-$NGINX_VERSION.tar.gz
	cd nginx-$NGINX_VERSION

	# configure nginx
	./configure --with-pcre --with-http_ssl_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_stub_status_module --prefix=/opt/nginx-$NGINX_VERSION

	# make nginx and install
	make
	make install	
fi

# create the appropriate nginx links
ln -sf /opt/nginx-$NGINX_VERSION /opt/nginx

# ensure we have services setup
echo "==> Checking service configurations";
if [ ! -e /etc/init/nginx.conf ]
then
	echo "==> Installing nginx service";
fi


echo "==> Adding auto completion for npm"
npm completion >> ~/.bashrc
source ~/.bashrc
